inherited frmManZCB_CUENTABANCARIA: TfrmManZCB_CUENTABANCARIA
  Left = 304
  Top = 86
  Caption = 'Cuentas Bancarias'
  ClientHeight = 470
  ClientWidth = 752
  Constraints.MinHeight = 500
  Constraints.MinWidth = 760
  Font.Name = 'Tahoma'
  ExplicitLeft = 304
  ExplicitTop = 86
  ExplicitWidth = 760
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 752
    ExplicitWidth = 752
  end
  inherited CoolBar: TCoolBar
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 748
      end>
    ExplicitWidth = 752
    inherited ToolBar: TToolBar
      Width = 739
      ExplicitWidth = 739
    end
  end
  inherited Grid: TArtDBGrid
    Width = 752
    Height = 396
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'CB_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BA_NOMBRE'
        Title.Caption = 'Banco'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CB_NUMERO'
        Title.Caption = 'Cuenta'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CB_SUCURSAL'
        Title.Caption = 'Sucursal'
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CB_RECAUDADORAAFIP'
        Title.Caption = 'Recaudadora AFIP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CB_CUENTACONTABLE'
        Title.Caption = 'Cuenta Contable'
        Width = 154
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CB_SLAP'
        Title.Alignment = taCenter
        Title.Caption = 'SLAP'
        Width = 30
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CB_ACREEDORES'
        Title.Alignment = taCenter
        Title.Caption = 'Acreedores Exigibles'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CB_CONCILIACION'
        Title.Alignment = taCenter
        Title.Caption = 'Conciliaci'#243'n'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CBU'
        Width = 173
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CB_INVERSIONES'
        Title.Alignment = taCenter
        Title.Caption = 'Inversiones'
        Width = 66
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 112
    Top = 168
    Width = 536
    Height = 209
    Constraints.MaxHeight = 209
    Constraints.MaxWidth = 536
    Constraints.MinHeight = 209
    Constraints.MinWidth = 536
    ExplicitLeft = 112
    ExplicitTop = 168
    ExplicitWidth = 536
    ExplicitHeight = 209
    inherited BevelAbm: TBevel
      Top = 173
      Width = 528
      ExplicitTop = 173
      ExplicitWidth = 528
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 14
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'Banco'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 40
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'Cuenta'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 95
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'Sucursal'
    end
    object Label4: TLabel [4]
      Left = 8
      Top = 151
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'Cuenta Contable'
    end
    object lblCBU: TLabel [5]
      Left = 8
      Top = 67
      Width = 100
      Height = 13
      AutoSize = False
      Caption = 'CBU'
    end
    object lblSeparador: TLabel [6]
      Left = 170
      Top = 67
      Width = 9
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
    end
    inherited btnAceptar: TButton
      Left = 381
      Top = 179
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      ExplicitLeft = 381
      ExplicitTop = 179
    end
    inherited btnCancelar: TButton
      Left = 456
      Top = 179
      TabOrder = 12
      ExplicitLeft = 456
      ExplicitTop = 179
    end
    inline fraCB_IDBANCO: TfraStaticCodigoDescripcion
      Left = 107
      Top = 8
      Width = 424
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 107
      ExplicitTop = 8
      ExplicitWidth = 424
      inherited cmbDescripcion: TComboGrid
        Width = 361
        ExplicitWidth = 361
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
    object edCB_NUMERO: TPatternEdit
      Left = 108
      Top = 36
      Width = 121
      Height = 21
      MaxLength = 12
      TabOrder = 1
      Pattern = '0123456789/'
    end
    object edCB_SUCURSAL: TEdit
      Left = 108
      Top = 91
      Width = 92
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 5
      TabOrder = 4
    end
    object chkCB_RECAUDADORAAFIP: TCheckBox
      Left = 6
      Top = 121
      Width = 115
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Recaudadora AFIP'
      TabOrder = 5
    end
    object edCB_CUENTACONTABLE: TPatternEdit
      Left = 108
      Top = 147
      Width = 221
      Height = 21
      MaxLength = 25
      TabOrder = 10
      Pattern = '0123456789'
    end
    object chkSLAP: TCheckBox
      Left = 138
      Top = 121
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = 'SLAP'
      TabOrder = 6
    end
    object chkAcreedoresExigibles: TCheckBox
      Left = 204
      Top = 121
      Width = 123
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Acreedores Exigibles'
      TabOrder = 7
    end
    object chkConciliacion: TCheckBox
      Left = 348
      Top = 121
      Width = 78
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Conciliaci'#243'n'
      TabOrder = 8
    end
    object edCB_CBU1: TPatternEdit
      Left = 108
      Top = 63
      Width = 61
      Height = 21
      MaxLength = 8
      TabOrder = 2
      OnChange = edCB_CBU1Change
      Pattern = '0123456789'
    end
    object edCB_CBU2: TPatternEdit
      Left = 179
      Top = 63
      Width = 95
      Height = 21
      MaxLength = 14
      TabOrder = 3
      Pattern = '0123456789'
    end
    object chkCB_INVERSIONES: TCheckBox
      Left = 447
      Top = 121
      Width = 80
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Inversiones'
      TabOrder = 9
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CB_ID, CB_IDBANCO, BA_NOMBRE,  CB_NUMERO, CB_SUCURSAL, CB' +
        '_RECAUDADORAAFIP,'
      
        '       CB_CUENTACONTABLE, CB_FECHABAJA, CB_SLAP, CB_ACREEDORES, ' +
        'CB_CONCILIACION,'
      
        '       CB_CBU1, CB_CBU2, DECODE(CB_CBU1, NULL, NULL, CB_CBU1 || ' +
        #39'-'#39' || CB_CBU2) CBU,'
      '       CB_INVERSIONES, BA_CUIT,'
      '       ART.UTILES.ARMAR_CUIT(BA_CUIT) CUIT'
      '  FROM ZBA_BANCO, ZCB_CUENTABANCARIA'
      ' WHERE BA_ID = CB_IDBANCO'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
