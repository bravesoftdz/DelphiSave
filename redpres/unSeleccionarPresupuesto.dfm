inherited frmSeleccionarPresupuesto: TfrmSeleccionarPresupuesto
  Left = 199
  Top = 107
  Width = 650
  Height = 324
  BorderIcons = [biSystemMenu]
  Caption = 'Selecci'#243'n del Presupuesto'
  Constraints.MinHeight = 324
  Constraints.MinWidth = 650
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 642
    Height = 9
  end
  inherited CoolBar: TCoolBar
    Top = 9
    Width = 642
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 638
      end>
    inherited ToolBar: TToolBar
      Width = 625
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 4
      end
      inherited ToolButton5: TToolButton
        Visible = True
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 5
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
      inherited ToolButton8: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        ImageIndex = 8
        Visible = False
      end
      object tbSeleccionar: TToolButton
        Left = 370
        Top = 0
        Hint = 'Seleccionar (Ctrl+C)'
        Caption = 'tbSeleccionar'
        ImageIndex = 14
        OnClick = tbSeleccionarClick
      end
      object ToolButton1: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object tbSalir2: TToolButton
        Left = 401
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        ImageIndex = 8
        OnClick = tbSalir2Click
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 38
    Width = 642
    Height = 259
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRESUPUESTO'
        Title.Alignment = taCenter
        Title.Caption = 'Presupuesto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 148
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FEC_PEDIDO'
        Title.Alignment = taCenter
        Title.Caption = 'F. Pedido'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAT_SOLI'
        Title.Caption = 'Material Solicitado'
        Width = 239
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAT_COTI'
        Title.Caption = 'Material Cotizado'
        Width = 354
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VIG_HASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia Hasta'
        Width = 78
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'COTIZACION'
        Title.Alignment = taCenter
        Title.Caption = 'Cotizaci'#243'n'
        Width = 87
        Visible = True
      end>
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
      end
      item
        Key = 16451
        LinkControl = tbSeleccionar
      end>
  end
end
