inherited frmManCierreDeCaja: TfrmManCierreDeCaja
  Left = 69
  Top = 104
  Caption = 'Apertura y Cierre de Cajas'
  Font.Name = 'Tahoma'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 0
    inherited ToolBar: TToolBar
      inherited tbRefrescar: TToolButton
        Visible = False
      end
      inherited ToolButton5: TToolButton
        Visible = False
      end
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbOrdenar: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbAbrirCerrar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Abrir / Cerrar Caja'
        Caption = 'tbAbrirCerrar'
        ImageIndex = 15
        OnClick = tbAbrirCerrarClick
      end
      object tbSalir2: TToolButton
        Left = 393
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Height = 410
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Caption = 'Fecha Caja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo de Caja'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVA'
        Title.Caption = 'Activa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CC_USUALTA'
        Title.Caption = 'U. Apertura'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CC_FECHAALTA'
        Title.Caption = 'F. Apertura'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CC_USUMODIF'
        Title.Caption = 'U. Cierre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CC_FECHAMODIF'
        Title.Caption = 'F. Cierre'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 155
    Top = 100
    Width = 312
    Height = 96
    Caption = 'Abrir / Cerrar Cajas'
    BorderStyle = bsDialog
    Position = poScreenCenter
    Constraints.MaxHeight = 96
    Constraints.MaxWidth = 312
    Constraints.MinHeight = 96
    Constraints.MinWidth = 312
    OnEnter = fpAbmEnter
    inherited BevelAbm: TBevel
      Top = 60
      Width = 304
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 10
      Width = 22
      Height = 13
      Caption = 'Caja'
    end
    object Label2: TLabel [2]
      Left = 7
      Top = 37
      Width = 31
      Height = 13
      Caption = 'Acci'#243'n'
    end
    object Label3: TLabel [3]
      Left = 185
      Top = 37
      Width = 29
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha'
    end
    inherited btnAceptar: TButton
      Left = 157
      Top = 66
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 232
      Top = 66
    end
    object cmbCC_TIPO: TComboBox
      Left = 41
      Top = 6
      Width = 266
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
      OnChange = cmbCC_TIPOChange
      Items.Strings = (
        'Caja de Egreso'
        'Caja de Ingreso'
        'Caja de Efectivo')
    end
    object cmbCC_FECHACAJA: TDateComboBox
      Left = 219
      Top = 33
      Width = 88
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object cmbAccion: TComboBox
      Left = 41
      Top = 33
      Width = 139
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 4
      OnChange = cmbAccionChange
      Items.Strings = (
        'Abrir Caja'
        'Cerrar Caja')
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT CC_FECHACAJA FECHA, DECODE(CC_TIPO, '#39'E'#39','#39'Egreso'#39','#39'Ingreso' +
        #39') TIPO,'
      
        '               DECODE(CC_ACTIVA, '#39'S'#39', '#39'SI'#39','#39'NO'#39') ACTIVA, CC_USUA' +
        'LTA, CC_FECHAALTA,'
      '               CC_USUMODIF, CC_FECHAMODIF'
      '   FROM RCC_CIERRECAJA'
      'ORDER BY CC_ID DESC ')
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
        LinkControl = tbSalir2
      end>
  end
end
