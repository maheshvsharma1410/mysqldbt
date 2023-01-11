
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

select * from (

    select c.code, c.name, c.region, l.language from simpliatransformeddb.airbyte_country c join simpliatransformeddb.airbyte_countrylanguage l on c.code = l.countrycode 
    where l.language='English' And l.isOfficial='T'

) as source_data



/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
