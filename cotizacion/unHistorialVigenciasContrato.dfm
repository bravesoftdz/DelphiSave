inherited frmHistorialVigenciasContrato: TfrmHistorialVigenciasContrato
  Left = 234
  Top = 111
  Width = 760
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Historial de Vigencias por Contrato'
  Constraints.MinHeight = 280
  Constraints.MinWidth = 400
  FormStyle = fsNormal
  KeyPreview = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  Visible = False
  OnKeyUp = FSFormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 752
    Height = 160
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 744
      Height = 152
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Datos de la empresa '
      TabOrder = 0
      DesignSize = (
        744
        152)
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object Label2: TLabel
        Left = 8
        Top = 36
        Width = 68
        Height = 13
        Caption = 'Denominaci'#243'n'
      end
      object Label3: TLabel
        Left = 8
        Top = 52
        Width = 42
        Height = 13
        Caption = 'Domicilio'
      end
      object Label4: TLabel
        Left = 8
        Top = 68
        Width = 44
        Height = 13
        Caption = 'Provincia'
      end
      object Label5: TLabel
        Left = 8
        Top = 84
        Width = 65
        Height = 13
        Caption = 'C'#243'digo Postal'
      end
      object Label6: TLabel
        Left = 8
        Top = 100
        Width = 64
        Height = 13
        Caption = 'CIIU Principal'
      end
      object Label7: TLabel
        Left = 8
        Top = 116
        Width = 30
        Height = 13
        Caption = 'CIIU 2'
      end
      object Label8: TLabel
        Left = 8
        Top = 132
        Width = 30
        Height = 13
        Caption = 'CIIU 3'
      end
      object lbCuit: TLabel
        Left = 40
        Top = 20
        Width = 30
        Height = 13
        Caption = 'CUIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbRazonSocial: TLabel
        Left = 84
        Top = 36
        Width = 648
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Denominaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbDomicilio: TLabel
        Left = 56
        Top = 52
        Width = 680
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Domicilio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbProvincia: TLabel
        Left = 60
        Top = 68
        Width = 672
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Provincia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCodigoPostal: TLabel
        Left = 80
        Top = 84
        Width = 79
        Height = 13
        Caption = 'C'#243'digo Postal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCiiu1: TLabel
        Left = 80
        Top = 100
        Width = 656
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'CIIU Principal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbCiiu2: TLabel
        Left = 44
        Top = 116
        Width = 696
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'CIIU 2'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lbCiiu3: TLabel
        Left = 44
        Top = 132
        Width = 696
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'CIIU 3'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 160
    Width = 752
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 748
      end>
    inherited ToolBar: TToolBar
      Width = 735
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = False
      end
      inherited tbMaxRegistros: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 189
    Width = 752
    Height = 264
    Columns = <
      item
        Expanded = False
        FieldName = 'HV_ART'
        Title.Caption = 'Aseguradora'
        Width = 123
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'HV_CONTRATO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Contrato'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HV_VIGENCIADESDE'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia Desde'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACIONDESDE'
        Title.Caption = 'Operaci'#243'n Desde'
        Width = 93
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HV_VIGENCIAHASTA'
        Title.Alignment = taCenter
        Title.Caption = 'Vigencia Hasta'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACIONHASTA'
        Title.Caption = 'Operaci'#243'n Hasta'
        Width = 102
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'HV_NIVEL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Nivel'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIIU'
        Title.Caption = 'Ciiu'
        Width = 150
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'HV_SUMAFIJA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Suma Fija'
        Width = 69
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'HV_PORCENTAJEVARIABLE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Porcentaje Variable'
        Width = 116
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'HV_FFE'
        Title.Alignment = taRightJustify
        Title.Caption = 'FFE'
        Visible = True
      end>
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
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
