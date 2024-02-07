*&---------------------------------------------------------------------*
*& Report ZRCADASTRO_CLIENTE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zrcadastro_cliente.

TABLES: ztcadclientes.

DATA: t_cliente TYPE TABLE OF ztcadclientes,
      w_cliente TYPE ztcadclientes.

SELECTION-SCREEN BEGIN OF BLOCK 1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: r_cad  RADIOBUTTON GROUP a USER-COMMAND radio_btn DEFAULT 'X',
              r_exib RADIOBUTTON GROUP a,
              r_edit RADIOBUTTON GROUP a,
              r_delt RADIOBUTTON GROUP a.
SELECTION-SCREEN END OF BLOCK 1.

"cadastrar
SELECTION-SCREEN BEGIN OF BLOCK 2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_nome TYPE ztcadclientes-nome MODIF ID ra1,
              p_cpf  TYPE ztcadclientes-cpf MODIF ID ra1,
              p_rg   TYPE ztcadclientes-rg MODIF ID ra1,
              p_data TYPE ztcadclientes-data MODIF ID ra1,
              p_ende TYPE ztcadclientes-ende MODIF ID ra1.
SELECTION-SCREEN END OF BLOCK 2.

"exibir
SELECTION-SCREEN BEGIN OF BLOCK 3 WITH FRAME TITLE TEXT-003.
  SELECT-OPTIONS: so_nome FOR ztcadclientes-nome MODIF ID ra2,
                  so_cpf FOR ztcadclientes-cpf MODIF ID ra2,
                  so_rg FOR ztcadclientes-rg MODIF ID ra2.
SELECTION-SCREEN END OF BLOCK 3.

"editar
SELECTION-SCREEN BEGIN OF BLOCK 4 WITH FRAME TITLE TEXT-004.
  PARAMETERS: p_nomed TYPE ztcadclientes-nome MODIF ID ra3,
              p_cpfed TYPE ztcadclientes-cpf MODIF ID ra3,
              p_rged  TYPE ztcadclientes-rg MODIF ID ra3,
              p_dated TYPE ztcadclientes-data MODIF ID ra3,
              p_ended TYPE ztcadclientes-ende MODIF ID ra3.
SELECTION-SCREEN END OF BLOCK 4.

"Deletar
SELECTION-SCREEN BEGIN OF BLOCK 5 WITH FRAME TITLE TEXT-005.
  PARAMETERS: p_nomedl TYPE ztcadclientes-nome MODIF ID ra4,
              p_cpfdl  TYPE ztcadclientes-cpf MODIF ID ra4,
              p_rgdl   TYPE ztcadclientes-rg MODIF ID ra4.
SELECTION-SCREEN END OF BLOCK 5.

AT SELECTION-SCREEN OUTPUT.
  PERFORM f_modifica_tela.

*&---------------------------------------------------------------------*
*& Form f_modifica_tela
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_modifica_tela .

  LOOP AT SCREEN.
    IF r_cad = 'X'.
      IF screen-group1 = 'RA1'.
        screen-invisible = 0.
        screen-input     = 1.
        screen-active    = 1.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA2'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA3'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA4'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.
    ELSEIF r_exib = 'X'.
      IF screen-group1 = 'RA2'.
        screen-invisible = 0.
        screen-input     = 1.
        screen-active    = 1.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA1'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA3'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA4'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.
    ELSEIF r_edit = 'X'.
      IF screen-group1 = 'RA3'.
        screen-invisible = 0.
        screen-input     = 1.
        screen-active    = 1.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA1'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA2'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA4'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.
    ELSEIF r_delt = 'X'.
      IF screen-group1 = 'RA4'.
        screen-invisible = 0.
        screen-input     = 1.
        screen-active    = 1.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA1'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA2'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ELSEIF screen-group1 = 'RA3'.
        screen-invisible = 1.
        screen-input     = 0.
        screen-active    = 0.
        MODIFY SCREEN.
        CONTINUE.
      ENDIF.
    ENDIF.
  ENDLOOP.
ENDFORM.


START-OF-SELECTION.

  PERFORM f_radiobutton.

*&---------------------------------------------------------------------*
*& Form f_radiobutton
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> R_CAD
*&---------------------------------------------------------------------*
FORM f_radiobutton .

  IF r_cad = 'X'.
    PERFORM f_cadastra_cliente.
  ELSEIF r_exib = 'X'.
    PERFORM f_seleciona_dados.
  ELSEIF r_edit = 'X'.
    PERFORM f_edita_dados.
  ELSEIF r_delt = 'X'.
    PERFORM f_deleta_cadastro.
  ENDIF.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form F_CADASTRA_CLIENTE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_cadastra_cliente .

  IF p_nome IS INITIAL.
    MESSAGE TEXT-006 TYPE 'I' DISPLAY LIKE 'E'. "Campo nome precisa ser informado
    LEAVE LIST-PROCESSING.
  ELSEIF p_cpf IS INITIAL.
    MESSAGE TEXT-007 TYPE 'I' DISPLAY LIKE 'E'. "Campo CPF precisa ser informado
    LEAVE LIST-PROCESSING.
  ELSEIF p_rg IS INITIAL.
    MESSAGE TEXT-008 TYPE 'I' DISPLAY LIKE 'E'. "Campo RG precisa ser informado
    LEAVE LIST-PROCESSING.
  ELSE.
    w_cliente-nome = p_nome.
    w_cliente-cpf = p_cpf.
    w_cliente-rg = p_rg.
    w_cliente-data = p_data.
    w_cliente-ende = p_ende.
    INSERT ztcadclientes FROM w_cliente.

    IF sy-subrc = 0.
      COMMIT WORK.
      MESSAGE TEXT-009 TYPE 'S'. "Cliente cadastrado com sucesso
    ELSE.
      MESSAGE TEXT-010 TYPE 'E'. "Cliente não pode ser cadastrado
    ENDIF.
  ENDIF.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form f_seleciona_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_seleciona_dados .

  SELECT * FROM ztcadclientes
    INTO TABLE t_cliente
    WHERE nome IN so_nome
    AND cpf IN so_cpf
    AND rg IN so_rg.

  IF t_cliente IS NOT INITIAL.
    WRITE: /5(15) 'Nome',
           30(11) 'CPF',
           50(10) 'RG',
           70(10) 'Data Nasc.',
           90(20) 'Endereço'.
  ENDIF.

  LOOP AT t_cliente INTO w_cliente.
    WRITE: /5(15) w_cliente-nome,
           30(11) w_cliente-cpf,
           50(10) w_cliente-rg,
           70(10) w_cliente-data,
           90(20) w_cliente-ende.
  ENDLOOP.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form f_edita_dados
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_edita_dados .

  IF p_cpfed IS INITIAL.
    MESSAGE TEXT-007 TYPE 'I' DISPLAY LIKE 'E'. "Campo CPF precisa ser informado.
    LEAVE LIST-PROCESSING.
  ELSEIF p_rged IS INITIAL.
    MESSAGE TEXT-008 TYPE 'I' DISPLAY LIKE 'E'. "Campo RG precisa ser informado.
    LEAVE LIST-PROCESSING.
  ENDIF.

  SELECT * FROM ztcadclientes
    INTO TABLE t_cliente
    WHERE rg EQ p_rged
    AND cpf EQ p_cpfed.

  IF sy-subrc = 0.
    w_cliente-nome = p_nomed.
    w_cliente-cpf = p_cpfed.
    w_cliente-rg = p_rged.
    w_cliente-data = p_dated.
    w_cliente-ende = p_ended.
    MODIFY ztcadclientes FROM w_cliente.

    IF sy-subrc = 0.
      COMMIT WORK.
      MESSAGE TEXT-011 TYPE 'S'. "Cliente modificado com sucesso
    ELSE.
      MESSAGE TEXT-012 TYPE 'E'. "Cliente não pode ser modificado
    ENDIF.
  ELSE.
    MESSAGE TEXT-013 TYPE 'E'. "Cliente não cadastrado
  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_deleta_cadastro
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_deleta_cadastro .

  SELECT * FROM ztcadclientes
    INTO TABLE t_cliente
    WHERE cpf EQ p_cpfdl
    AND rg EQ p_rgdl.

  IF sy-subrc = 0.
    w_cliente-nome = p_nomedl.
    w_cliente-cpf = p_cpfdl.
    w_cliente-rg = p_rgdl.
  ENDIF.

  DELETE ztcadclientes FROM w_cliente.

  IF sy-subrc = 0.
    COMMIT WORK.
    MESSAGE TEXT-014 TYPE 'S'. "Cliente deletado com sucesso
  ELSE.
    MESSAGE TEXT-015 TYPE 'E'. "Erro ao deletar cliente
  ENDIF.

ENDFORM.
