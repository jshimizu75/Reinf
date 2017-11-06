SELECT NFE_COD_SERV_BBL COD_SERVICO,
       TO_NUMBER(TO_CHAR(EFFDT,'YYYYMMDD'),'99999999') DATA_X2018,
       REPLACE(SUBSTR(DESCR254,1,50),'.','') DESCRICAO,
       '@' IND_TP_SERVICO,-- 0:Normal ou 1:Equiparado a Construção Civil
       '@' IND_MAT_SERV,
       '@' IND_CONTRATO,
       '@' IND_SERVICOS_TERC,
       '@' COD_NAT_SERV,
       '@' DESC_NAT_SERV,
       '@' CODIGO_CONTABIL,
       '@' INSS,
       '@' ISS,
       '@' IRRF,
       '@' ALIQUOTA_INSS,
       '@' ALIQUOTA_ISS,
       '@' ALIQUOTA_IRRF,
       '@' VLR_ALIQ_INSC,
       '@' VLR_ALIQ_S_INSC,
       '@' VLR_PERC_FRETE_AUT,
       LPAD(REPLACE(ITEM_SERV_BBL,'.',''),4,0) COD_SERV_LEI_116,
       '@' IND_DEDUCAO,   -- Informar a dedução a ser aplicada em atendimento a DS - Recife
       '@' COD_ATIVIDADE, -- Utilizado para o preenchimento do campo 24 do layout da DDS Fortaleza
       '@' COD_NAT_SERV_SPED,
       REPLACE(SUBSTR(DESCR254,1,100),'.','') DESC_NAT_SERV_SPED
FROM FDSPPRD.PS_SERV_COD_BBL A
WHERE A.EFFDT = (
        SELECT MAX(EFFDT)
        FROM FDSPPRD.PS_SERV_COD_BBL A_ED
        WHERE A_ED.NFE_COD_SERV_BBL = A.NFE_COD_SERV_BBL
        AND A_ED.EFFDT <= TO_DATE(TO_CHAR(SYSDATE,'YYYY-MM-DD'),'YYYY-MM-DD')
    )
ORDER BY 1