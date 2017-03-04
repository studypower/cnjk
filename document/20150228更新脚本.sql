ALTER TABLE `oa_notice_info`
ADD COLUMN `isSendAll`  int(11) NULL DEFAULT 0 COMMENT '是否发送给所有人：0,非所有；1,所有' AFTER `orderby`;