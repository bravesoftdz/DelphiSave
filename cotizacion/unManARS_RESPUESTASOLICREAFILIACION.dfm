inherited frmManARS_RESPUESTASOLICREAFILIACION: TfrmManARS_RESPUESTASOLICREAFILIACION
  Left = 292
  Top = 202
  Caption = 'Motivos de Respuesta de Revisi'#243'n'
  ClientWidth = 716
  ExplicitWidth = 724
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 716
  end
  inherited CoolBar: TCoolBar
    Width = 716
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 712
      end>
    inherited ToolBar: TToolBar
      Width = 703
      ExplicitWidth = 703
    end
  end
  inherited Grid: TArtDBGrid
    Width = 716
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'RS_ID'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RS_DETALLE'
        Title.Caption = 'Motivo'
        Width = 363
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_DETALLE'
        Title.Caption = 'Motivo Solicitud Revisi'#243'n'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Grupo'
        Width = 95
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 152
    Width = 376
    Height = 129
    BorderStyle = bsDialog
    ActiveControl = edDetalle
    ExplicitLeft = 124
    ExplicitTop = 152
    ExplicitWidth = 376
    ExplicitHeight = 129
    inherited BevelAbm: TBevel
      Top = 93
      Width = 368
      ExplicitTop = 60
      ExplicitWidth = 368
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 12
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Motivo'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 36
      Width = 75
      Height = 13
      Caption = 'Motivo Solicitud'
    end
    inherited btnAceptar: TButton
      Left = 216
      Top = 99
      Width = 72
      ExplicitLeft = 216
      ExplicitTop = 66
      ExplicitWidth = 72
    end
    inherited btnCancelar: TButton
      Left = 296
      Top = 99
      Width = 72
      ExplicitLeft = 296
      ExplicitTop = 66
      ExplicitWidth = 72
    end
    object edDetalle: TEdit
      Left = 88
      Top = 8
      Width = 280
      Height = 21
      TabOrder = 2
      Text = 'edDetalle'
    end
    inline fraMotivoSolicitud: TfraCodDesc
      Left = 88
      Top = 32
      Width = 280
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ExplicitLeft = 88
      ExplicitTop = 32
      ExplicitWidth = 280
      inherited cmbDescripcion: TArtComboBox
        Left = 44
        Width = 236
        ExplicitLeft = 44
        ExplicitWidth = 236
      end
      inherited edCodigo: TPatternEdit
        Width = 40
        ExplicitWidth = 40
      end
      inherited Propiedades: TPropiedadesFrame
        FieldBaja = 'MS_FECHABAJA'
        FieldCodigo = 'MS_CODIGO'
        FieldDesc = 'MS_DETALLE'
        FieldID = 'MS_ID'
        IdType = ctInteger
        TableName = 'AMS_MOTIVOSOLICREAFILIACION'
      end
    end
    object rgGrupo: TRadioGroup
      Left = 8
      Top = 54
      Width = 360
      Height = 37
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Grupo'
      Columns = 3
      Items.Strings = (
        'Aumento'
        'Rebaja'
        'Cambio CIIU')
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   ars.*, ms_detalle, DECODE(rs_tipo, '#39'A'#39',  '#39'Aumento'#39', '#39'R'#39 +
        ', '#39'Rebaja'#39', '#39'C'#39', '#39'Cambio CIIU'#39') tipo'
      
        '    FROM ars_respuestasolicreafiliacion ars LEFT JOIN ams_motivo' +
        'solicreafiliacion ON (ms_id ='
      
        '                                                                ' +
        '                         ars.rs_idsolicitud'
      
        '                                                                ' +
        '                     )'
      'ORDER BY rs_detalle')
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
  end
end
