inherited frmManCTC_TEXTOCARTA_EMI: TfrmManCTC_TEXTOCARTA_EMI
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 40
    Visible = True
    object Label12: TLabel
      Left = 337
      Top = 9
      Width = 85
      Height = 13
      Caption = 'M. de Notificaci'#243'n'
    end
    object Label13: TLabel
      Left = 4
      Top = 9
      Width = 68
      Height = 14
      AutoSize = False
      Caption = 'Item Gesti'#243'n'
    end
    inline fraModoNotificacionFiltro: TfraCodigoDescripcion
      Left = 425
      Top = 5
      Width = 270
      Height = 23
      TabOrder = 1
      DesignSize = (
        270
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 215
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    inline fraItemGestionFiltro: TfraCodigoDescripcion
      Left = 70
      Top = 5
      Width = 257
      Height = 23
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 201
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 40
  end
  inherited Grid: TArtDBGrid
    Top = 69
    Height = 504
  end
  inherited fpAbm: TFormPanel
    Left = 219
    Top = 33
    inherited Label1: TLabel
      Left = 0
      Top = 243
      Visible = False
    end
    inherited Label2: TLabel
      Top = 79
    end
    object Label10: TLabel [11]
      Left = 4
      Top = 57
      Width = 68
      Height = 14
      AutoSize = False
      Caption = 'Item Gesti'#243'n'
    end
    object Label11: TLabel [12]
      Left = 360
      Top = 32
      Width = 85
      Height = 13
      Caption = 'M. de Notificaci'#243'n'
    end
    object Label14: TLabel [13]
      Left = 401
      Top = 103
      Width = 42
      Height = 13
      Caption = 'Firmante'
    end
    inherited btnAceptar: TButton
      TabOrder = 20
    end
    inherited btnCancelar: TButton
      TabOrder = 21
    end
    inherited PageControl: TPageControl
      TabOrder = 19
      inherited tsAreas: TTabSheet
        inherited fpAbmAreas: TFormPanel
          inherited fraArea: TfraStaticCodigoDescripcion
            inherited cmbDescripcion: TComboGrid
              Cells = (
                'C'#243'digo'
                'Descripci'#243'n'
                'Id'
                'Fecha de Baja')
              ColWidths = (
                40
                300
                -1
                -1)
            end
          end
        end
      end
      object tsParametrosManuales: TTabSheet
        Caption = 'Par'#225'metros Manuales'
        ImageIndex = 3
      end
    end
    inherited GroupBox1: TGroupBox
      TabOrder = 10
    end
    inherited edTC_CODIGO: TEdit
      Left = 80
    end
    inherited fraTC_MOTIVOCIERRE: TfraCtbTablas
      Left = 75
      Top = 239
      Visible = False
    end
    inherited fraTC_FORMATOASOC: TfraCodigoDescripcion
      Top = 75
      inherited cmbDescripcion: TArtComboBox
        Width = 205
      end
    end
    inherited chkExigeRechazo: TCheckBox
      TabOrder = 12
    end
    inherited edTC_TEXTODESTINAT: TEdit
      Width = 272
      TabOrder = 7
    end
    inherited fraTC_TIPOSALIDA: TfraCtbTablas
      Width = 259
      TabOrder = 6
      DesignSize = (
        259
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 206
      end
    end
    inherited chkDatosCitacion: TCheckBox
      TabOrder = 13
    end
    inherited edTC_LEYENDAACUSE: TMemo
      Width = 273
      TabOrder = 8
    end
    inherited chkGobernacion: TCheckBox
      TabOrder = 14
    end
    inherited chkTextoModificable: TCheckBox
      TabOrder = 16
    end
    inherited chkTextoAltaManual: TCheckBox
      TabOrder = 15
    end
    inherited pnFechaVigencia: TPanel
      Left = 295
      Width = 345
      TabOrder = 17
      inherited Label6: TLabel
        Left = 2
        Width = 58
        Caption = 'F.Vig.Desde'
      end
      inherited Label7: TLabel
        Left = 154
        Width = 56
        Caption = 'F.Vig.Hasta'
      end
      inherited Label8: TLabel
        Left = 303
      end
      inherited lbNumeroMov: TLabel
        Left = 319
      end
      inherited edFechaVigenciaDesde: TDateEdit
        Left = 63
      end
      inherited edFechaVigenciaHasta: TDateEdit
        Left = 212
      end
    end
    inherited pnBotoneraTrabajador: TPanel
      TabOrder = 18
    end
    inherited pnSqlAvisoRecibido: TPanel
      TabOrder = 11
    end
    inline fraGestionable: TfraCodigoDescripcion
      Left = 79
      Top = 52
      Width = 276
      Height = 23
      TabOrder = 5
      inherited cmbDescripcion: TArtComboBox
        Left = 52
        Width = 222
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    inline fraModoNotificacion: TfraCodigoDescripcion
      Left = 448
      Top = 28
      Width = 270
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 23
      DesignSize = (
        270
        23)
      inherited cmbDescripcion: TArtComboBox
        Left = 54
        Width = 205
      end
      inherited edCodigo: TPatternEdit
        Width = 48
      end
    end
    inline fraCodigoCodFirmante: TfraStaticCodigoDescripcion
      Left = 448
      Top = 99
      Width = 261
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      inherited edCodigo: TPatternEdit
        Width = 48
      end
      inherited cmbDescripcion: TComboGrid
        Left = 54
        Width = 205
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT DISTINCT tc_id, tc_nombre, tc_destinatario, desti.tb_desc' +
        'ripcion destino,'
      
        '                iif_char(tc_rpt, '#39#39', '#39'Manual'#39', '#39'Autom'#225'tico'#39') con' +
        'tenido, tc_rpt, tc_usualta, tc_usubaja, tc_fechabaja, tc_codigo,'
      
        '                tc_motivocierre, motivo.tb_descripcion motivo, t' +
        'c_formatorel, tc_exigerechazo, tc_textodestinatario,'
      
        '                TRUNC(tc_fechaalta) tc_fechaalta, tc_tiposalida,' +
        ' tc_datoscitacion, tc_leyendaacuse, tc_gobernacion,'
      
        '                tc_textomodificable, tc_textoaltamanual, tc_sqla' +
        'visorecibo, gs_idgestionable, gs_idcartatexto'
      
        '           FROM emi.igs_gestionablesalida, ctc_textocarta, cat_a' +
        'reatexto, cta_textoarea, ctb_tablas desti, ctb_tablas motivo'
      '          WHERE desti.tb_clave(+) = '#39'DESTI'#39
      '            AND desti.tb_codigo(+) = tc_destinatario'
      '            AND motivo.tb_clave(+) = '#39'CATER'#39
      '            AND motivo.tb_codigo(+) = tc_motivocierre'
      '            AND motivo.tb_especial1(+) = '#39'S'#39
      '            AND ta_idtextocarta = tc_id'
      '            AND ta_idareatexto = at_id'
      '            AND tc_id = gs_idcartatexto(+)'
      '            AND gs_fechabaja(+) IS NULL'
      ''
      '')
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'TC_CODIGO'
      end
      item
        DataField = 'TC_NOMBRE'
      end
      item
        DataField = 'DESTINO'
      end>
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end
      item
        MaxLength = 0
      end>
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end>
  end
  inherited sdqAreas: TSDQuery
    Left = 16
  end
end
