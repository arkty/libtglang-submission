
/*------------------------------------------------------------------------
    File        : veoingreso.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : pdigonzelli
    Created     : Tue Jan 19 07:00:36 ACT 2016
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

DEFINE VAR CFECHA AS DATE NO-UNDO.

DEFINE QUERY QPESADAS FOR balanza_pesadas.
DEFINE QUERY QTICKETS FOR balanza_tickets.
DEFINE QUERY QTICKETS1 FOR balanza_tickets.
DEFINE QUERY QTICKETS2 FOR balanza_tickets.
DEFINE QUERY QSALDOS   FOR saldos_packing.

DEFINE BROWSE BPESADAS QUERY QPESADAS 
    DISPLAY balanza_pesadas.fecha_entrada 
            balanza_pesadas.fecha_operativa 
            balanza_pesadas.fecha_salida
            balanza_pesadas.id_balanza
            balanza_pesadas.id_pesada
            balanza_pesadas.id_pesada_sap
            balanza_pesadas.id_proveedor
            balanza_pesadas.id_sucursal
            balanza_pesadas.id_tipo_movsto
            balanza_pesadas.nro
            balanza_pesadas.nromov
            balanza_pesadas.orden_carga_sap
            balanza_pesadas.patente
            balanza_pesadas.peso_descarte
            balanza_pesadas.peso_entrada
            balanza_pesadas.peso_envases_entrada
            balanza_pesadas.peso_envases_salida
            balanza_pesadas.peso_neto
            balanza_pesadas.peso_salida
            balanza_pesadas.tara WITH 5 DOWN TITLE 'PESADAS'.
            

DEFINE BROWSE BTICKETS QUERY QTICKETS 
    DISPLAY
        balanza_tickets.cant_env_entrada
        balanza_tickets.cert_china
        balanza_tickets.certificado
        balanza_tickets.china
        balanza_tickets.cod_barra_sap
        balanza_tickets.codigo_trazabilidad FORMAT 'X(10)'
        balanza_tickets.fecha_cosecha
        balanza_tickets.fecha_entrada
        balanza_tickets.fecha_operativa
        balanza_tickets.fecha_remito
        balanza_tickets.fecha_salida
        balanza_tickets.finca
        balanza_tickets.hora_entrada
        balanza_tickets.hora_salida
        balanza_tickets.id_balanza
        balanza_tickets.id_color
    WITH 10 DOWN TITLE 'TICKETS'.

DEFINE BROWSE BTICKETS2 QUERY QTICKETS2 
    DISPLAY
        balanza_tickets.id_descarte
        balanza_tickets.id_envase
        balanza_tickets.id_etiqueta
        balanza_tickets.id_finca_senasa
        balanza_tickets.id_lote
        balanza_tickets.id_lote_senasa
        balanza_tickets.id_materia_prima
        balanza_tickets.id_mercado
        balanza_tickets.id_origen
        balanza_tickets.id_origen_origen
        balanza_tickets.id_pesada
        balanza_tickets.id_proveedor
        balanza_tickets.id_proveedor_origen
        balanza_tickets.id_sucursal
        balanza_tickets.zona_up 
        balanza_tickets.union_europea
    WITH 10 DOWN TITLE 'TICKETS - CONT'.
         

DEFINE BROWSE BTICKETS1 QUERY QTICKETS1 
    DISPLAY
        balanza_tickets.renspa 
        balanza_tickets.pos_orden_compra_sap 
        balanza_tickets.peso_neto_ticket 
        balanza_tickets.peso_envases_entrada 
        balanza_tickets.peso_descarte 
        balanza_tickets.periodo_cosecha 
        balanza_tickets.orden_compra_sap 
        balanza_tickets.nro_ticket 
        balanza_tickets.nro_remito 
        balanza_tickets.nro_partida_serial 
        balanza_tickets.nro_partida_general 
        balanza_tickets.nro_partida 
        balanza_tickets.id_variedad_sap 
        balanza_tickets.id_variedad 
        balanza_tickets.id_tipo_servicio 
        balanza_tickets.id_tipo_cosecha 
        balanza_tickets.id_ticket_quincena 
        balanza_tickets.id_sucursal_packing 
        balanza_tickets.id_sucursal_etiqueta
         
    WITH 10 DOWN TITLE 'TICKETS - CONT'.

DEFINE BROWSE BSALDOS QUERY QSALDOS 
    DISPLAY
        saldos_packing.abierto
        saldos_packing.cantidad_salida
        saldos_packing.cantidad_total
        saldos_packing.cantidad_volcada
        saldos_packing.habilitado
        saldos_packing.saldo
        saldos_packing.id_sucursal
        saldos_packing.nro_partida
        saldos_packing.nro_partida_serial
        saldos_packing.id_sucursal_etiqueta
    WITH 2 DOWN TITLE 'SALDOS PACKING'.



CURRENT-WINDOW:TITLE = 'PESADAS'.

FORM BPESADAS SKIP BTICKETS SKIP BTICKETS2 SKIP BTICKETS1 SKIP BSALDOS WITH FRAME FPESADAS WIDTH 360.

ON VALUE-CHANGED OF BTICKETS DO:
    DEFINE VAR INDICE AS INTEGER NO-UNDO.
    INDICE = BTICKETS:FOCUSED-ROW.
    BROWSE BTICKETS1:SELECT-ROW(INDICE).
    BROWSE BTICKETS2:SELECT-ROW(INDICE).
    MESSAGE balanza_tickets.NRO_PARTIDA balanza_tickets.nro_partida_serial VIEW-AS ALERT-BOX.    
    OPEN QUERY QSALDOS FOR EACH saldos_packing WHERE saldos_packing.nro_partida = balanza_tickets.nro_partida AND 
                                                       saldos_packing.nro_partida_serial = balanza_tickets.nro_partida_serial NO-LOCK.    
END.
ON VALUE-CHANGED OF BTICKETS1 DO:
    DEFINE VAR INDICE AS INTEGER NO-UNDO.
    INDICE = BTICKETS1:FOCUSED-ROW.
    BROWSE BTICKETS:SELECT-ROW(INDICE).
    BROWSE BTICKETS2:SELECT-ROW(INDICE).
    OPEN QUERY QSALDOS FOR EACH saldos_packing WHERE saldos_packing.nro_partida = balanza_tickets.nro_partida AND 
                                                       saldos_packing.nro_partida_serial = balanza_tickets.nro_partida_serial NO-LOCK.
    
END.
ON VALUE-CHANGED OF BTICKETS2 DO:
    DEFINE VAR INDICE AS INTEGER NO-UNDO.
    INDICE = BTICKETS2:FOCUSED-ROW.
    BROWSE BTICKETS1:SELECT-ROW(INDICE).
    BROWSE BTICKETS:SELECT-ROW(INDICE).
    OPEN QUERY QSALDOS FOR EACH saldos_packing WHERE saldos_packing.nro_partida = balanza_tickets.nro_partida AND 
                                                     saldos_packing.nro_partida_serial = balanza_tickets.nro_partida_serial NO-LOCK.
END.


ON VALUE-CHANGED OF BPESADAS DO:
    GET CURRENT QPESADAS.
    OPEN QUERY QTICKETS FOR EACH balanza_tickets OF balanza_pesadas.
    OPEN QUERY QTICKETS1 FOR EACH balanza_tickets OF balanza_pesadas.
    OPEN QUERY QTICKETS2 FOR EACH balanza_tickets OF balanza_pesadas.
    OPEN QUERY QSALDOS FOR EACH saldos_packing WHERE saldos_packing.nro_partida = balanza_tickets.nro_partida AND 
                                                     saldos_packing.nro_partida_serial = balanza_tickets.nro_partida_serial NO-LOCK.
END.


OPEN QUERY QPESADAS FOR EACH balanza_pesadas NO-LOCK WHERE balanza_pesadas.fecha_entrada >= DATE('09/03/2016').

CURRENT-WINDOW:WIDTH = 380.
CURRENT-WINDOW:HEIGHT = 80.

ENABLE ALL WITH FRAME FPESADAS.

WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.
