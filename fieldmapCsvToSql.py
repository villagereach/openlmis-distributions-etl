# coding=utf-8

import collections
import csvUnicode

# This script is a stripped down version of \\VRSERVER\Shared\ISG\01 OpenLMIS\vrMIS Migration\toolset\vrmisToSelvCsv.py
# Whereas vrmisToSelvCsv.py contains legacy VRMIS-related code, this script is intended for use exclusively with more
# recent versions of OpenLMIS.

VISIT_FIELD_MAP_CSV = 'fieldmap.csv'
VISIT_TABLE_SQL_FILE = 'facility_visits_report.sql'
VISIT_TABLE_NAME = 'facility_visits_report'


def loadVisitFieldMap():
    mapfile = open(VISIT_FIELD_MAP_CSV, mode='rb')
    reader = csvUnicode.DictUnicodeReader(mapfile)
    fieldMap = collections.OrderedDict()
    for row in reader:
        fieldName = row['fieldname']
        vrmisName = row.get('vrmis_fieldname', '')
        fieldType = row['type']
        nullable = False if int(row['nullable']) == 0 else True
        sqlIgnore = False if int(row['sql_ignore']) == 0 else True
        constraint = row.get('constraint', '')
        if fieldName in fieldMap:
            print 'ERROR: Duplicate field name: ' + fieldName
        fieldMap[fieldName] = {'vrmisName': vrmisName, 'type': fieldType, 'nullable': nullable, 'sqlIgnore': sqlIgnore, 'constraint': constraint}

    mapfile.close()
    return fieldMap


def writeCreateTableSql(filePath, fieldMap, tableName):
    f = open(filePath, mode='wb')
    f.write('DROP TABLE IF EXISTS ' + tableName + ';\n')
    f.write('CREATE TABLE ' + tableName + ' ( id serial PRIMARY KEY\n')
    for fieldName, fieldD in fieldMap.iteritems():
        if fieldD.get('sqlIgnore') is True: continue
        constraints = ''
        constraints += ' NOT NULL' if fieldD['nullable'] is False else ''
        constraints += ' ' + fieldD['constraint'] if fieldD['constraint'] != '' else ''
        f.write('\t, ' + fieldName + ' ' + fieldD['type'] + constraints + '\n')
    f.write('); \n\n')

    f.write('GRANT CONNECT ON DATABASE open_lmis TO olreporter; \n\n')
    f.write('GRANT USAGE ON SCHEMA public TO olreporter; \n\n')
    f.write('GRANT SELECT ON facility_visits_report TO olreporter; \n\n')
    f.write('ALTER DEFAULT PRIVILEGES IN SCHEMA public \nGRANT SELECT ON TABLES TO olreporter;')
    f.close()


#### program ####

print 'Loading visit field mappings... '
visitFieldMap = loadVisitFieldMap()

print 'Writing create visit table SQL...'
writeCreateTableSql(VISIT_TABLE_SQL_FILE, visitFieldMap, VISIT_TABLE_NAME)

print 'Done.'