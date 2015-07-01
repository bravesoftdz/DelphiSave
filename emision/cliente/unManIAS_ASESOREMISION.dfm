inherited frmManIAS_ASESOREMISION: TfrmManIAS_ASESOREMISION
  Left = 138
  Top = 103
  Width = 640
  Height = 350
  Caption = 'Mantenimiento de Asesores de Emisi'#243'n'
  Constraints.MinHeight = 350
  Constraints.MinWidth = 640
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 632
    Height = 10
  end
  inherited CoolBar: TCoolBar
    Top = 10
    Width = 632
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 628
      end>
    inherited ToolBar: TToolBar
      Width = 615
      inherited tbImprimir: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 39
    Width = 632
    Height = 284
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'AS_NOMBRE'
        Title.Caption = 'Asesor'
        Width = 238
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AS_INTERNO'
        Title.Alignment = taCenter
        Title.Caption = 'Interno'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'AS_FECHABAJA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha de baja'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AS_MAIL'
        Title.Caption = 'Correo electr'#243'nico'
        Width = 174
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 76
    Top = 80
    Width = 477
    Height = 141
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 105
      Width = 469
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 54
      Width = 33
      Height = 13
      Caption = 'Asesor'
    end
    object Label5: TLabel [2]
      Left = 8
      Top = 84
      Width = 36
      Height = 13
      Caption = 'Interno'
    end
    object Label2: TLabel [3]
      Left = 112
      Top = 84
      Width = 33
      Height = 13
      Caption = 'Correo'
    end
    inherited btnAceptar: TButton
      Left = 322
      Top = 111
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    inherited btnCancelar: TButton
      Left = 397
      Top = 111
      TabOrder = 6
    end
    object edAS_NOMBRE: TEdit
      Left = 46
      Top = 50
      Width = 423
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 2
    end
    object edAS_INTERNO: TPatternEdit
      Left = 46
      Top = 80
      Width = 51
      Height = 21
      MaxLength = 4
      TabOrder = 3
      Pattern = '0123456789'
    end
    object edAS_MAIL: TEdit
      Left = 148
      Top = 80
      Width = 321
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 100
      TabOrder = 4
    end
    object rgTipo: TRadioGroup
      Left = 8
      Top = 4
      Width = 141
      Height = 40
      Caption = 'Tipo'
      Columns = 2
      Items.Strings = (
        'Interno'
        'Externo')
      TabOrder = 0
      OnClick = rgTipoClick
    end
    inline fraAS_USUARIO: TfraUsuarios
      Left = 45
      Top = 49
      Width = 426
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 333
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM IAS_ASESOREMISION')
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
