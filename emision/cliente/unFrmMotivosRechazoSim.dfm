inherited frmMotivosRechazoSim: TfrmMotivosRechazoSim
  Left = 258
  Top = 141
  Width = 581
  Height = 476
  Caption = 'Motivos de Rechazo de Simulaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 573
    Height = 1
  end
  inherited CoolBar: TCoolBar
    Top = 1
    Width = 573
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 569
      end>
    inherited ToolBar: TToolBar
      Width = 556
      inherited tbModificar: TToolButton
        Enabled = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 30
    Width = 573
    Height = 419
    Columns = <
      item
        Expanded = False
        FieldName = 'MS_ID'
        Title.Caption = 'N'#250'mero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MS_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 310
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 104
    Top = 96
    Width = 417
    Height = 121
    Caption = 'Agregar empresas a omitir'
    inherited BevelAbm: TBevel
      Left = 0
      Top = 85
      Width = 409
    end
    object lblDesc: TLabel [1]
      Left = 8
      Top = 36
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object lblNumber: TLabel [2]
      Left = 8
      Top = 12
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label2: TLabel [3]
      Left = 8
      Top = 61
      Width = 60
      Height = 13
      Caption = 'Observaci'#243'n'
    end
    inherited btnAceptar: TButton
      Left = 259
      Top = 91
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 337
      Top = 91
      TabOrder = 3
    end
    object edDescripcion: TEdit
      Left = 72
      Top = 32
      Width = 335
      Height = 21
      TabOrder = 1
    end
    object edIdMotivo: TEdit
      Left = 72
      Top = 8
      Width = 42
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    inline fraObservacion: TfraCodigoDescripcionExt
      Left = 70
      Top = 57
      Width = 312
      Height = 23
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 247
      end
    end
    object tbComandosDetalle: TToolBar
      Left = 382
      Top = 54
      Width = 28
      Height = 28
      Align = alNone
      BorderWidth = 1
      Caption = 'ToolBar'
      EdgeBorders = []
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      object tbAddObservacion: TToolButton
        Left = 0
        Top = 2
        ImageIndex = 14
        OnClick = tbAddObservacionClick
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT ms_id, ms_descripcion, ms_fechaalta, ms_usualta, ms_fecha' +
        'modif,'
      
        '               ms_usumodif, ms_fechabaja, ms_usubaja, MS_IDOBSER' +
        'VACION'
      'FROM EMI.IMS_MOTIVOSIMULACION'
      'WHERE 1= 2'
      '')
  end
end
