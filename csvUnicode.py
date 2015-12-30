import csv, codecs, cStringIO

class UTF8Recorder:
    def __init__(self, f, encoding):
	self.reader = codecs.getreader(encoding)(f)

    def __iter__(self):
	return self

    def next(self):
	return self.reader.next().encode('utf-8')

class DictUnicodeReader:

    def __init__(self, f, dialect=csv.excel, encoding='utf-8', **kwds):
	f = UTF8Recorder(f, encoding)
	self.reader = csv.DictReader(f, dialect=dialect, **kwds)

    def next(self):
	row = self.reader.next()
	return dict({(unicode(key, 'utf-8'), unicode(value, 'utf-8')) for key, value in row.iteritems()})

    def __iter__(self):
	return self

class DictUnicodeWriter:
    def __init__(self, f, fieldnames, dialect=csv.excel, encoding='utf-8', **kwds):
	self.queue = cStringIO.StringIO()
	self.writer = csv.DictWriter(self.queue, fieldnames, dialect=dialect, **kwds)
	self.stream = f
	self.encoder = codecs.getincrementalencoder(encoding)()

    def writerow(self, D):
	self.writer.writerow({unicode(k).encode('utf-8'):unicode(v).encode('utf-8') for k,v in D.iteritems()})
	data = self.queue.getvalue()
	data = data.decode('utf-8')
	data = self.encoder.encode(data)
	self.stream.write(data)
	self.queue.truncate(0)

    def writerows(self, rows):
	for D in rows:
	    self.writerow(D)
    
    def writeheader(self):
	self.writer.writeheader()
    
