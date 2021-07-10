-- 一、upsert-kafka
--左表, 测试水位线时加上 watermark for op_ts as op_ts
create table left_upsert(
    appl_seq  string
    ,amount   decimal(16,2)
    ,op_ts    timestamp(3)
    ,primary key(appl_seq) not enforced
) with (
    'connecotr' = 'upsert-kafka'
    ,'topic' = 'left-upsert'
    ,'key.format' = 'json'
    ,'value.format' = 'json'
    ,'properties.bootstrap.servers' = 'xxx:9092,xxx:9092,xxx:9092'    
    ,'properties.group.id' = 'left-upsert-group'
)

--右表, 测试水位线时加上 watermark for op_ts as op_ts
create table right_upsert(
    appl_seq  string
    ,amount   decimal(16,2)
    ,op_ts    timestamp(3)
    ,primary key(appl_seq) not enforced
) with (
    'connecotr' = 'upsert-kafka'
    ,'topic' = 'right-upsert'
    ,'key.format' = 'json'
    ,'value.format' = 'json'
    ,'properties.bootstrap.servers' = 'xxx:9092,xxx:9092,xxx:9092'    
    ,'properties.group.id' = 'right-upsert-group'
)

-- 二、json-kafka
--左表, 测试水位线时加上 watermark for op_ts as op_ts
create table left_json(
    appl_seq  string
    ,amount   decimal(16,2)
    ,op_ts    timestamp(3)
) with (
    'connecotr' = 'kafka'
    ,'topic' = 'left-json'
    ,'value.format' = 'json'
    ,'scan.startup.mode' = 'latest-offset'    
    ,'properties.bootstrap.servers' = 'xxx:9092,xxx:9092,xxx:9092'    
    ,'properties.group.id' = 'left-json-group'
)

--右表, 测试水位线时加上 watermark for op_ts as op_ts
create table right_json(
    appl_seq  string
    ,amount   decimal(16,2)
    ,op_ts    timestamp(3)
) with (
    'connecotr' = 'kafka'
    ,'topic' = 'right-json'
    ,'value.format' = 'json'
    ,'scan.startup.mode' = 'latest-offset'
    ,'properties.bootstrap.servers' = 'xxx:9092,xxx:9092,xxx:9092'    
    ,'properties.group.id' = 'right-json-group'
)

