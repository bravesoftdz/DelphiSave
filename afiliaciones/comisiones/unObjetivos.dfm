inherited frmObjetivos: TfrmObjetivos
  Left = 110
  Top = 82
  Width = 560
  Height = 465
  BorderIcons = [biSystemMenu]
  Caption = 'Objetivos'
  Constraints.MinWidth = 560
  FormStyle = fsNormal
  Position = poOwnerFormCenter
  Visible = False
  OnActivate = FSFormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 552
    Height = 20
  end
  inherited CoolBar: TCoolBar
    Top = 20
    Width = 552
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 548
      end>
    inherited ToolBar: TToolBar
      Width = 535
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbAprobar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Aprobar (Ctrl+A)'
        ImageIndex = 13
        OnClick = tbAprobarClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalirClick
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 49
    Width = 552
    Height = 389
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    Columns = <
      item
        Expanded = False
        FieldName = 'objetivo'
        Title.Caption = 'Objetivo'
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'capitasdesde'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas Desde'
        Width = 81
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'capitashasta'
        Title.Alignment = taCenter
        Title.Caption = 'C'#225'pitas Hasta'
        Width = 81
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'porccomisionprivado'
        Title.Alignment = taCenter
        Title.Caption = '% Comisi'#243'n Privado'
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'porccomisionpublico'
        Title.Alignment = taCenter
        Title.Caption = '% Comisi'#243'n P'#250'blico'
        Width = 99
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechaalcance'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alcance'
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'fechaaprobado'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Aprobado'
        Width = 88
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 160
    Width = 368
    Height = 91
    ActiveControl = fraObjetivo
    Constraints.MaxHeight = 91
    Constraints.MinHeight = 91
    Constraints.MinWidth = 368
    inherited BevelAbm: TBevel
      Top = 55
      Width = 360
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 23
      Width = 42
      Height = 13
      Caption = 'Objetivo:'
    end
    inherited btnAceptar: TButton
      Left = 208
      Top = 61
      Width = 72
      TabOrder = 1
    end
    inherited btnCancelar: TButton
      Left = 288
      Top = 61
      Width = 72
      TabOrder = 2
    end
    inline fraObjetivo: TfraCodDesc
      Left = 56
      Top = 18
      Width = 304
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited Propiedades: TPropiedadesFrame
        TableName = 'XOB_OBJETIVO'
        FieldID = 'OB_ID'
        FieldCodigo = 'OB_ID'
        FieldDesc = 'OB_DESCRIPCION'
        FieldBaja = 'OB_FECHABAJA'
        OrderBy = 'OB_DESCRIPCION'
        CodigoType = ctInteger
        IdType = ctInteger
      end
    end
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
      end
      item
        Key = 16449
        LinkControl = tbAprobar
      end>
  end
end
