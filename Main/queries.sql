drop view IF EXISTS vw_derecho_habiencia;

drop table IF EXISTS d_defunciones_generales;

CREATE TABLE d_defunciones_generales (

  ent_regis INT NULL,

  mun_regis INT NULL,

  ent_resid INT NULL,

  mun_resid INT NULL,

  tloc_resid INT NULL,

  loc_resid INT NULL,

  ent_ocurr INT NULL,

  mun_ocurr INT NULL,

  tloc_ocurr INT NULL,

  loc_ocurr INT NULL,

  causa_def varchar(100) NULL,

  lista_mex varchar(100) NULL,

  sexo INT NULL,

  edad INT NULL,

  dia_ocurr INT NULL,

  mes_ocurr INT NULL,

  anio_ocur INT NULL,

  dia_regis INT NULL,

  mes_regis INT NULL,

  anio_regis INT NULL,

  dia_nacim INT NULL,

  mes_nacim INT NULL,

  anio_nacim INT NULL,

  ocupacion INT NULL,

  escolarida INT NULL,

  edo_civil INT NULL,

  presunto INT NULL,

  ocurr_trab INT NULL,

  lugar_ocur INT NULL,

  necropsia INT NULL,

  asist_medi INT NULL,

  sitio_ocur INT NULL,

  cond_cert INT NULL,

  nacionalid INT NULL,

  derechohab INT NULL,

  embarazo INT NULL,

  rel_emba INT NULL,

  horas INT NULL,

  minutos INT NULL,

  capitulo INT NULL,

  grupo INT NULL,

  lista1 INT NULL,

  gr_lismex varchar(100) NULL,

  vio_fami INT NULL,

  area_ur INT NULL,

  edad_agru INT NULL,

  complicaro INT NULL,

  dia_cert INT NULL,

  mes_cert INT NULL,

  anio_cert INT NULL,

  maternas varchar(100) NULL,

  lengua INT NULL,

  cond_act INT NULL,

  par_agre INT NULL,

  ent_ocules INT NULL,

  mun_ocules INT NULL,

  loc_ocules INT NULL,

  razon_m INT NULL,

  dis_re_oax INT NULL,

  data_year INT NULL

);



create view vw_derecho_habiencia as

select data_year, derechohab, (select ded.DESCRIP from c_dederech ded where ded.dederech_id = def.derechohab) derechi_habiencia, count(*) cantidad_derecho

from d_defunciones_generales def 

group by data_year, derechohab;





Create VIEW vw_def_by_years as 


select data_year, causa_def, ent_regis,

(select DESCRIP from c_decatcausa cda where cda.decatcausa_id =  ddef.causa_def) asdasd,

count(*) count_

from d_defunciones_generales ddef

group by causa_def, data_year

order by count_ desc;



CREATE VIEW  vw_deaths_states as 

Select data_year, ent_regis, count(*) count_ from d_defunciones_generales

group by ent_regis, data_year



Select * FROM vw_deaths_states



Create view vw_time_to_die as

select horas, data_year,

count(*) count_

from d_defunciones_generales ddef

group by horas

order by horas;



create view vw_derechohabiencia_death as

select data_year, 

	derechohab, 

	(select d_derech.DESCRIP from c_dederech d_derech where d_derech.dederech_id = ddef.derechohab) derechohabiencia,

    count(*) muertes

from d_defunciones_generales ddef

group by data_year, derechohab;

--select * from vw_all_data_forest limit 100;
--drop view vw_all_data_forest
select * from vw_all_data_forest

drop view vw_all_data_forest;
create view vw_all_data_forest as
select 
--    data_year,
--    sexo 'id_gender', 
    (select DESCRIP from c_desexo cdex where cdex.desexo_id =  ddef.sexo) sexo_desc,
--- edad 'id_age', 
    (select edad_r from c_deedad d_edad where d_edad.deedad_id =  ddef.edad) edad_num,
--  (select DESCRIP from c_deedad d_edad where d_edad.deedad_id =  ddef.edad) edad_desc,
    
  --  capitulo 'id_capitulo', 
--    (select DESCRIP from c_decapitulo d_capi where d_capi.decapitulo_id =  ddef.capitulo) capitulo_desc,
--    gr_lismex,
    (select DESCRIPCION from c_degpolisme d_g_list_mex where d_g_list_mex.degpolisme_id =  ddef.gr_lismex) grupo_mex,
--  lista_mex, 
    --(select DESCRIP from c_delistamex d_listmex where d_listmex.delistamex_id =  ddef.lista_mex) lista_mex_desc,  -- causa dertalle se quita por tanto detalle
  --  (select is_main from c_delistamex d_listmex where d_listmex.delistamex_id =  ddef.lista_mex) lista_mex_principal,
   -- causa_def, 
    --(select DESCRIP from c_decatcausa cda where cda.decatcausa_id =  ddef.causa_def) causa_detalle,  -- causa dertalle se quita por tanto detalle

    -- grupo, 
    -- (select DESCRIP from c_decapgpo d_gpo where d_gpo.decapgpo_id =  ddef.grupo) grupo_desc,

   -- ent_ocurr, 
    (select e_enti.DESCRIP from c_entidades e_enti where e_enti.id_entidad = ddef.ent_ocurr) entidad_ocurrencia,
    --(select e_enti.Latitude from c_entidades e_enti where e_enti.id_entidad = ddef.ent_ocurr) Latitude,
    --(select e_enti.Longitude from c_entidades e_enti where e_enti.id_entidad = ddef.ent_ocurr) Longitude,
    -- mun_ocurr, 
    -- (select cats.nom_loc from c_decateml cats where cats.decateml_locacion_id = 0  and cats.decateml_municipio_id = ddef.mun_ocurr
    -- and cats.decateml_entidad_id = ddef.ent_ocurr) municipio_ocurrencia,
--    ent_regis, 
  --  (select e_enti.DESCRIP from c_entidades e_enti where e_enti.id_entidad = ddef.ent_regis) entidad_registro,
    -- mun_regis, 
    -- (select cats.nom_loc from c_decateml cats where cats.decateml_locacion_id = 0  and cats.decateml_municipio_id = ddef.mun_regis
    -- and cats.decateml_entidad_id = ddef.ent_regis)  mun_registro,

    --dia_nacim,
    --mes_nacim,
    --anio_nacim, 
    --dia_ocurr,
    mes_ocurr,
   -- anio_ocur,
    
    --ocupacion,
    (select e_ocu.DESCRIP from c_deocupa e_ocu where e_ocu.deocupa_id = ddef.ocupacion) ocupa_desc,
    
    ---escolarida,
    (select e_esco.DESCRIP from c_deesco e_esco where e_esco.deesco_id = ddef.escolarida) escola_desc,
    
    --edo_civil, 
    (select e_esco.DESCRIP from c_deedocony e_esco where e_esco.deedocony_id = ddef.edo_civil) edo_conyu,
    
    --lugar_ocur,
   -- (select lugar_lesion.DESCRIP from c_desitiolesion lugar_lesion where lugar_lesion.desitiolesion_id = ddef.lugar_ocur) sitio_lesion,
        
    --nacionalid,
    (select naci.DESCRIP from c_denacion naci where naci.denacion_id = ddef.nacionalid) naciona

from d_defunciones_generales ddef;

Create view vw_time_to_die as
select horas, data_year,
count(*) count_
from d_defunciones_generales ddef
group by horas, data_year
order by horas;

