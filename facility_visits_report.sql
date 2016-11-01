DROP TABLE IF EXISTS facility_visits_report;
CREATE TABLE facility_visits_report ( id serial PRIMARY KEY
	, visit_code text NOT NULL unique
	, facility_id integer NOT NULL references facilities(id)
	, district_id integer NOT NULL references geographic_zones(id)
	, province_id integer NOT NULL references geographic_zones(id)
	, delivery_zone_id integer NOT NULL references delivery_zones(id)
	, period_id integer NOT NULL references processing_periods(id)
	, visited boolean
	, visited_date date
	, visited_last_date date
	, no_visit_reason text
	, no_visit_other_reason text
	, observations text
	, verified_by_name text
	, verified_by_title text
	, confirmed_by_name text
	, confirmed_by_title text
	, catchement_population integer
	, epi_inventory_bcg_spoiled integer
	, epi_inventory_bcg_existing integer
	, epi_inventory_bcg_delivered integer
	, epi_inventory_bcg_isa integer
	, epi_inventory_bcgdil_spoiled integer
	, epi_inventory_bcgdil_existing integer
	, epi_inventory_bcgdil_delivered integer
	, epi_inventory_bcgdil_isa integer
	, epi_inventory_polio10_spoiled integer
	, epi_inventory_polio10_existing integer
	, epi_inventory_polio10_delivered integer
	, epi_inventory_polio10_isa integer
	, epi_inventory_polio20_spoiled integer
	, epi_inventory_polio20_existing integer
	, epi_inventory_polio20_delivered integer
	, epi_inventory_polio20_isa integer
	, epi_inventory_penta1_spoiled integer
	, epi_inventory_penta1_existing integer
	, epi_inventory_penta1_delivered integer
	, epi_inventory_penta1_isa integer
	, epi_inventory_penta10_spoiled integer
	, epi_inventory_penta10_existing integer
	, epi_inventory_penta10_delivered integer
	, epi_inventory_penta10_isa integer
	, epi_inventory_pcv10_spoiled integer
	, epi_inventory_pcv10_existing integer
	, epi_inventory_pcv10_delivered integer
	, epi_inventory_pcv10_isa integer
	, epi_inventory_hpv2_spoiled integer
	, epi_inventory_hpv2_existing integer
	, epi_inventory_hpv2_delivered integer
	, epi_inventory_hpv2_isa integer
	, epi_inventory_measles_spoiled integer
	, epi_inventory_measles_existing integer
	, epi_inventory_measles_delivered integer
	, epi_inventory_measles_isa integer
	, epi_inventory_measlesdil_spoiled integer
	, epi_inventory_measlesdil_existing integer
	, epi_inventory_measlesdil_delivered integer
	, epi_inventory_measlesdil_isa integer
	, epi_inventory_tetanus_spoiled integer
	, epi_inventory_tetanus_existing integer
	, epi_inventory_tetanus_delivered integer
	, epi_inventory_tetanus_isa integer
	, epi_inventory_ipv_spoiled integer
	, epi_inventory_ipv_existing integer
	, epi_inventory_ipv_delivered integer
	, epi_inventory_ipv_isa integer
	, epi_inventory_rotarix_spoiled integer
	, epi_inventory_rotarix_existing integer
	, epi_inventory_rotarix_delivered integer
	, epi_inventory_rotarix_isa integer
	, epi_inventory_sarampo1_spoiled integer
	, epi_inventory_sarampo1_existing integer
	, epi_inventory_sarampo1_delivered integer
	, epi_inventory_sarampo1_isa integer
	, epi_inventory_sarampo2_spoiled integer
	, epi_inventory_sarampo2_existing integer
	, epi_inventory_sarampo2_delivered integer
	, epi_inventory_sarampo2_isa integer
	, epi_inventory_sarampo2diluent_spoiled integer
	, epi_inventory_sarampo2diluent_existing integer
	, epi_inventory_sarampo2diluent_delivered integer
	, epi_inventory_sarampo2diluent_isa integer
	, epi_inventory_gas_existing integer
	, epi_inventory_gas_delivered integer
	, epi_inventory_gas_isa integer
	, epi_inventory_syringe20ml_existing integer
	, epi_inventory_syringe20ml_delivered integer
	, epi_inventory_syringe20ml_isa integer
	, epi_inventory_syringe10ml_existing integer
	, epi_inventory_syringe10ml_delivered integer
	, epi_inventory_syringe10ml_isa integer
	, epi_inventory_syringe5ml_existing integer
	, epi_inventory_syringe5ml_delivered integer
	, epi_inventory_syringe5ml_isa integer
	, epi_inventory_syringe05ml_existing integer
	, epi_inventory_syringe05ml_delivered integer
	, epi_inventory_syringe05ml_isa integer
	, epi_inventory_syringe005ml_existing integer
	, epi_inventory_syringe005ml_delivered integer
	, epi_inventory_syringe005ml_isa integer
	, epi_inventory_safetybox_existing integer
	, epi_inventory_safetybox_delivered integer
	, epi_inventory_safetybox_isa integer
	, epi_use_bcg_first_of_month integer
	, epi_use_bcg_received integer
	, epi_use_bcg_distributed integer
	, epi_use_bcg_loss integer
	, epi_use_bcg_end_of_month integer
	, epi_use_bcg_expiration date
	, epi_use_bcg_number_of_stockout_days integer
	, epi_use_bcgdil_first_of_month integer
	, epi_use_bcgdil_received integer
	, epi_use_bcgdil_distributed integer
	, epi_use_bcgdil_loss integer
	, epi_use_bcgdil_end_of_month integer
	, epi_use_bcgdil_expiration date
	, epi_use_bcgdil_number_of_stockout_days integer
	, epi_use_polio_first_of_month integer
	, epi_use_polio_received integer
	, epi_use_polio_distributed integer
	, epi_use_polio_loss integer
	, epi_use_polio_end_of_month integer
	, epi_use_polio_expiration date
	, epi_use_polio_number_of_stockout_days integer
	, epi_use_penta_first_of_month integer
	, epi_use_penta_received integer
	, epi_use_penta_distributed integer
	, epi_use_penta_loss integer
	, epi_use_penta_end_of_month integer
	, epi_use_penta_expiration date
	, epi_use_penta_number_of_stockout_days integer
	, epi_use_pcv_first_of_month integer
	, epi_use_pcv_received integer
	, epi_use_pcv_distributed integer
	, epi_use_pcv_loss integer
	, epi_use_pcv_end_of_month integer
	, epi_use_pcv_expiration date
	, epi_use_pcv_number_of_stockout_days integer
	, epi_use_hpv_first_of_month integer
	, epi_use_hpv_received integer
	, epi_use_hpv_distributed integer
	, epi_use_hpv_loss integer
	, epi_use_hpv_end_of_month integer
	, epi_use_hpv_expiration date
	, epi_use_hpv_number_of_stockout_days integer
	, epi_use_measles_first_of_month integer
	, epi_use_measles_received integer
	, epi_use_measles_distributed integer
	, epi_use_measles_loss integer
	, epi_use_measles_end_of_month integer
	, epi_use_measles_expiration date
	, epi_use_measles_number_of_stockout_days integer
	, epi_use_measlesdil_first_of_month integer
	, epi_use_measlesdil_received integer
	, epi_use_measlesdil_distributed integer
	, epi_use_measlesdil_loss integer
	, epi_use_measlesdil_end_of_month integer
	, epi_use_measlesdil_expiration date
	, epi_use_measlesdil_number_of_stockout_days integer
	, epi_use_tetanus_first_of_month integer
	, epi_use_tetanus_received integer
	, epi_use_tetanus_distributed integer
	, epi_use_tetanus_end_of_month integer
	, epi_use_tetanus_loss integer
	, epi_use_tetanus_expiration date
	, epi_use_tetanus_number_of_stockout_days integer
	, epi_use_ipv_first_of_month integer
	, epi_use_ipv_received integer
	, epi_use_ipv_distributed integer
	, epi_use_ipv_end_of_month integer
	, epi_use_ipv_loss integer
	, epi_use_ipv_expiration date
	, epi_use_ipv_number_of_stockout_days integer
	, epi_use_rotarix_first_of_month integer
	, epi_use_rotarix_received integer
	, epi_use_rotarix_distributed integer
	, epi_use_rotarix_end_of_month integer
	, epi_use_rotarix_loss integer
	, epi_use_rotarix_expiration date
	, epi_use_rotarix_number_of_stockout_days integer
	, epi_use_sarampo1_first_of_month integer
	, epi_use_sarampo1_received integer
	, epi_use_sarampo1_distributed integer
	, epi_use_sarampo1_end_of_month integer
	, epi_use_sarampo1_loss integer
	, epi_use_sarampo1_expiration date
	, epi_use_sarampo1_number_of_stockout_days integer
	, epi_use_sarampo2_first_of_month integer
	, epi_use_sarampo2_received integer
	, epi_use_sarampo2_distributed integer
	, epi_use_sarampo2_end_of_month integer
	, epi_use_sarampo2_loss integer
	, epi_use_sarampo2_expiration date
	, epi_use_sarampo2_number_of_stockout_days integer
	, epi_use_sarampo1diluent_first_of_month integer
	, epi_use_sarampo1diluent_received integer
	, epi_use_sarampo1diluent_distributed integer
	, epi_use_sarampo1diluent_end_of_month integer
	, epi_use_sarampo1diluent_loss integer
	, epi_use_sarampo1diluent_expiration date
	, epi_use_sarampo1diluent_number_of_stockout_days integer
	, epi_use_sarampo2diluent_first_of_month integer
	, epi_use_sarampo2diluent_received integer
	, epi_use_sarampo2diluent_distributed integer
	, epi_use_sarampo2diluent_end_of_month integer
	, epi_use_sarampo2diluent_loss integer
	, epi_use_sarampo2diluent_expiration date
	, epi_use_sarampo2diluent_number_of_stockout_days integer
	, adult_coverage_mif_community_tetanus1hc integer
	, adult_coverage_mif_community_tetanus1mb integer
	, adult_coverage_mif_community_tetanus25hc integer
	, adult_coverage_mif_community_tetanus25mb integer
	, adult_coverage_mif_student_tetanus1mb integer
	, adult_coverage_mif_student_tetanus25mb integer
	, adult_coverage_mif_worker_tetanus1mb integer
	, adult_coverage_mif_worker_tetanus25mb integer
	, adult_coverage_pregnant_tetanus1hc integer
	, adult_coverage_pregnant_tetanus1mb integer
	, adult_coverage_pregnant_tetanus25hc integer
	, adult_coverage_pregnant_tetanus25mb integer
	, adult_coverage_pregnant_target_group integer
	, adult_coverage_worker_tetanus1mb integer
	, adult_coverage_worker_tetanus25mb integer
	, adult_coverage_worker_target_group integer
	, adult_coverage_student_tetanus1mb integer
	, adult_coverage_student_tetanus25mb integer
	, adult_coverage_student_target_group integer
	, adult_coverage_other_tetanus1hc integer
	, adult_coverage_other_tetanus1mb integer
	, adult_coverage_other_tetanus25hc integer
	, adult_coverage_other_tetanus25mb integer
	, adult_coverage_tetanus_vials_opened integer
	, child_coverage_bcg_hc0_11 integer
	, child_coverage_bcg_hc12_23 integer
	, child_coverage_bcg_mb0_11 integer
	, child_coverage_bcg_mb12_23 integer
	, child_coverage_bcg_target_group integer
	, child_coverage_bcg_vials_opened integer
	, child_coverage_measles_hc0_11 integer
	, child_coverage_measles_hc12_23 integer
	, child_coverage_measles_mb0_11 integer
	, child_coverage_measles_mb12_23 integer
	, child_coverage_measles_target_group integer
	, child_coverage_measles_vials_opened integer
	, child_coverage_pcv1_hc0_11 integer
	, child_coverage_pcv1_hc12_23 integer
	, child_coverage_pcv1_mb0_11 integer
	, child_coverage_pcv1_mb12_23 integer
	, child_coverage_pcv2_hc0_11 integer
	, child_coverage_pcv2_hc12_23 integer
	, child_coverage_pcv2_mb0_11 integer
	, child_coverage_pcv2_mb12_23 integer
	, child_coverage_pcv3_hc0_11 integer
	, child_coverage_pcv3_hc12_23 integer
	, child_coverage_pcv3_mb0_11 integer
	, child_coverage_pcv3_mb12_23 integer
	, child_coverage_pcv_target_group integer
	, child_coverage_pcv_vials_opened integer
	, child_coverage_penta1_hc0_11 integer
	, child_coverage_penta1_hc12_23 integer
	, child_coverage_penta1_mb0_11 integer
	, child_coverage_penta1_mb12_23 integer
	, child_coverage_penta2_hc0_11 integer
	, child_coverage_penta2_hc12_23 integer
	, child_coverage_penta2_mb0_11 integer
	, child_coverage_penta2_mb12_23 integer
	, child_coverage_penta3_hc0_11 integer
	, child_coverage_penta3_hc12_23 integer
	, child_coverage_penta3_mb0_11 integer
	, child_coverage_penta3_mb12_23 integer
	, child_coverage_penta_target_group integer
	, child_coverage_penta1_vials_opened integer
	, child_coverage_penta10_vials_opened integer
	, child_coverage_polio0_hc0_11 integer
	, child_coverage_polio0_mb0_11 integer
	, child_coverage_polio1_hc0_11 integer
	, child_coverage_polio1_hc12_23 integer
	, child_coverage_polio1_mb0_11 integer
	, child_coverage_polio1_mb12_23 integer
	, child_coverage_polio2_hc0_11 integer
	, child_coverage_polio2_hc12_23 integer
	, child_coverage_polio2_mb0_11 integer
	, child_coverage_polio2_mb12_23 integer
	, child_coverage_polio3_hc0_11 integer
	, child_coverage_polio3_hc12_23 integer
	, child_coverage_polio3_mb0_11 integer
	, child_coverage_polio3_mb12_23 integer
	, child_coverage_polio_target_group integer
	, child_coverage_polio10_vials_opened integer
	, child_coverage_polio20_vials_opened integer
	, child_coverage_ipv_hc0_11 integer
	, child_coverage_ipv_mb0_11 integer
	, child_coverage_ipv_target_group integer
	, child_coverage_ipv_vials_opened integer
	, child_coverage_rotarix1_hc0_11 integer
	, child_coverage_rotarix1_hc12_23 integer
	, child_coverage_rotarix1_mb0_11 integer
	, child_coverage_rotarix1_mb12_23 integer
	, child_coverage_rotarix2_hc0_11 integer
	, child_coverage_rotarix2_hc12_23 integer
	, child_coverage_rotarix2_mb0_11 integer
	, child_coverage_rotarix2_mb12_23 integer
	, child_coverage_rotarix_target_group integer
	, child_coverage_rotarix_vials_opened integer
	, child_coverage_sarampo1_hc0_11 integer
	, child_coverage_sarampo1_hc12_23 integer
	, child_coverage_sarampo1_mb0_11 integer
	, child_coverage_sarampo1_mb12_23 integer
	, child_coverage_sarampo1_target_group integer
	, child_coverage_sarampo1_vials_opened integer
	, child_coverage_sarampo2_hc12_23 integer
	, child_coverage_sarampo2_mb12_23 integer
	, child_coverage_sarampo2_target_group integer
	, child_coverage_sarampo2_vials_opened integer
	, full_vaccinations_male_hc integer
	, full_vaccinations_male_mb integer
	, full_vaccinations_female_hc integer
	, full_vaccinations_female_mb integer
);