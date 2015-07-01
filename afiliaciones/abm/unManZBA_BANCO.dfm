inherited frmManZBA_BANCO: TfrmManZBA_BANCO
  Left = 222
  Top = 114
  Caption = 'Mantenimiento de Bancos'
  ClientHeight = 401
  ClientWidth = 669
  ExplicitLeft = 222
  ExplicitTop = 114
  ExplicitWidth = 677
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 669
    Height = 5
    ExplicitWidth = 669
    ExplicitHeight = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 669
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 665
      end>
    ExplicitTop = 5
    ExplicitWidth = 669
    inherited ToolBar: TToolBar
      Width = 656
      ExplicitWidth = 656
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 669
    Height = 367
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BA_CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CUIT'
        Title.Alignment = taCenter
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BA_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 505
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BA_DATANET'
        Title.Alignment = taCenter
        Title.Caption = 'DataNet'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 133
    Top = 100
    Width = 381
    Height = 169
    ActiveControl = edBA_ID
    Constraints.MaxHeight = 169
    Constraints.MinHeight = 169
    Constraints.MinWidth = 381
    ExplicitLeft = 133
    ExplicitTop = 100
    ExplicitWidth = 381
    ExplicitHeight = 169
    DesignSize = (
      381
      169)
    inherited BevelAbm: TBevel
      Top = 133
      Width = 373
      ExplicitTop = 105
      ExplicitWidth = 373
    end
    object Label1: TLabel [1]
      Left = 10
      Top = 85
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label2: TLabel [2]
      Left = 11
      Top = 15
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label3: TLabel [3]
      Left = 11
      Top = 49
      Width = 25
      Height = 13
      Caption = 'CUIT'
    end
    inherited btnAceptar: TButton
      Left = 223
      Top = 139
      TabOrder = 4
      ExplicitLeft = 223
      ExplicitTop = 111
    end
    inherited btnCancelar: TButton
      Left = 301
      Top = 139
      TabOrder = 5
      ExplicitLeft = 301
      ExplicitTop = 111
    end
    object edBA_NOMBRE: TEdit
      Left = 60
      Top = 81
      Width = 309
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 2
    end
    object chkBA_DATANET: TCheckBox
      Left = 8
      Top = 114
      Width = 65
      Height = 17
      Alignment = taLeftJustify
      Caption = 'DataNet'
      TabOrder = 3
    end
    object edBA_ID: TPatternEdit
      Left = 60
      Top = 12
      Width = 45
      Height = 21
      MaxLength = 3
      TabOrder = 0
      OnExit = edBA_IDExit
      Pattern = '0123456789'
    end
    object edBA_CUIT: TMaskEdit
      Left = 60
      Top = 46
      Width = 81
      Height = 21
      Hint = 'CUIT de la Empresa'
      EditMask = '99-99999999-9;0;'
      MaxLength = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT BA_ID, BA_CODIGO, BA_NOMBRE, BA_DATANET, BA_FECHABAJA, BA' +
        '_CUIT,'
      '       ART.UTILES.ARMAR_CUIT(BA_CUIT) CUIT'
      '  FROM ZBA_BANCO'
      ' ORDER BY BA_CODIGO'
      '')
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxPortrait
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
