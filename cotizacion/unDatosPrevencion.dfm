inherited frmDatosPrevencion: TfrmDatosPrevencion
  Left = 433
  Top = 191
  Width = 500
  Caption = 'Datos de Prevenci'#243'n'
  Constraints.MinHeight = 348
  Constraints.MinWidth = 500
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 5
    Top = 84
    Width = 53
    Height = 13
    Caption = 'Evaluaci'#243'n'
  end
  inherited pnlBusqueda: TPanel
    Width = 492
    Height = 0
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Top = 0
    Width = 492
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 488
      end>
    inherited ToolBar: TToolBar
      Width = 475
      inherited tbNuevo: TToolButton
        ImageIndex = 6
        Visible = False
      end
      inherited tbModificar: TToolButton
        ImageIndex = 7
        Visible = False
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 1
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 4
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 5
      end
      object tbGuardar: TToolButton
        Left = 174
        Top = 0
        Hint = 'Grabar (Ctrl + G)'
        Caption = 'tbGuardar'
        ImageIndex = 3
        OnClick = tbGuardarClick
      end
    end
  end
  inherited pnlDatos: TPanel
    Top = 32
    Width = 491
    Height = 6
  end
  inherited btnAceptar: TButton
    Left = 338
    Visible = False
  end
  inherited btnCancelar: TButton
    Left = 416
    Visible = False
  end
  inherited btnAplicar: TButton
    Left = 259
    Visible = False
  end
  object GroupBox1: TGroupBox [7]
    Left = 1
    Top = 32
    Width = 490
    Height = 45
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Estado'
    TabOrder = 6
    DesignSize = (
      490
      45)
    inline fraCP_ESTADO: TfraStaticCTB_TABLAS
      Left = 6
      Top = 13
      Width = 478
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TComboGrid
        Width = 414
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
  end
  object edCP_INFORME: TMemo [8]
    Left = 1
    Top = 99
    Width = 490
    Height = 220
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'edCP_INFORME')
    ScrollBars = ssBoth
    TabOrder = 7
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
      end>
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
  end
end
