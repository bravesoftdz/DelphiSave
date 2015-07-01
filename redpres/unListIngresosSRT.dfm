inherited frmIngresosSRT: TfrmIngresosSRT
  Left = 290
  Top = 125
  Width = 681
  Height = 433
  Caption = 'Ingresos a la SRT'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 673
    Height = 99
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 673
      Height = 102
      Hint = 'pnlFiltros'
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 673
        Height = 102
        Hint = 'pnlFiltros'
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          673
          102)
        object chkSiniestro: TCheckPanel
          Left = 0
          Top = 3
          Width = 132
          Height = 45
          Caption = 'Siniestro '
          TabOrder = 0
          Checked = False
          OnChange = chkSiniestroChange
          object edSiniestro: TSinEdit
            Left = 7
            Top = 17
            Width = 119
            Height = 21
            TabOrder = 0
          end
        end
        object chkEmpresa: TCheckPanel
          Left = 135
          Top = 3
          Width = 537
          Height = 45
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Empresa '
          TabOrder = 1
          Checked = False
          OnChange = chkEmpresaChange
          DesignSize = (
            537
            45)
          inline fraEmpresa: TfraEmpresa
            Left = 7
            Top = 17
            Width = 523
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            inherited lbContrato: TLabel
              Left = 419
            end
            inherited edContrato: TIntEdit
              Left = 466
            end
            inherited cmbRSocial: TArtComboBox
              Width = 284
            end
          end
        end
        object chkFIngresoSRT: TCheckPanel
          Left = 0
          Top = 51
          Width = 201
          Height = 45
          Caption = 'F.Ingreso SRT '
          TabOrder = 2
          Checked = False
          OnChange = chkFIngresoSRTChange
          object Label5: TLabel
            Left = 95
            Top = 20
            Width = 12
            Height = 13
            Caption = '>>'
          end
          object dcFIngDesde: TDateComboBox
            Left = 7
            Top = 17
            Width = 88
            Height = 21
            MaxDateCombo = dcFIngHasta
            TabOrder = 0
          end
          object dcFIngHasta: TDateComboBox
            Left = 108
            Top = 17
            Width = 88
            Height = 21
            MinDateCombo = dcFIngDesde
            TabOrder = 1
          end
        end
        object chkTrabajador: TCheckPanel
          Left = 204
          Top = 51
          Width = 468
          Height = 45
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Trabajador '
          TabOrder = 3
          Checked = False
          OnChange = chkTrabajadorChange
          DesignSize = (
            468
            45)
          inline fraTrabajador: TfraTrabajador
            Left = 7
            Top = 17
            Width = 455
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            inherited cmbNombre: TArtComboBox
              Width = 371
            end
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 99
    Width = 673
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 669
      end>
    inherited ToolBar: TToolBar
      Width = 656
    end
  end
  inherited Grid: TArtDBGrid
    Top = 128
    Width = 673
    Height = 278
    Columns = <
      item
        Expanded = False
        FieldName = 'CUIL'
        Title.Caption = 'Cuil'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SINIESTRO'
        Title.Caption = 'Siniestro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Title.Caption = 'Cuit'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Raz'#243'n Social'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FRECAPRESUNTA'
        Title.Alignment = taCenter
        Title.Caption = 'Reca.Presunta'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FDESPRECA'
        Title.Alignment = taCenter
        Title.Caption = 'F.Ev.Desp.'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INDICADOR1'
        Title.Alignment = taCenter
        Title.Caption = 'Diferencia 1'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FEV042052'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha 042/052'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FEV093095'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha 093/095'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INDICADOR2'
        Title.Alignment = taCenter
        Title.Caption = 'Diferencia 2'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FEV013'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha 013'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INDICADOR3'
        Title.Alignment = taCenter
        Title.Caption = 'Diferencia 3'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RI_FECINGSRT'
        Title.Alignment = taCenter
        Title.Caption = 'F. ingreso SRT'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INDICADOR4'
        Title.Alignment = taCenter
        Title.Caption = 'Diferencia 4'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESPONSABLE093095'
        Title.Caption = 'Responsable 095/093'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO066'
        Title.Caption = 'Admin. de carga 066'
        Width = 110
        Visible = True
      end>
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Cuil'
        DataField = 'CUIL'
        FieldIndex = 0
      end
      item
        Title = 'Siniestro'
        DataField = 'SINIESTRO'
        FieldIndex = 0
      end
      item
        Title = 'Cuit'
        DataField = 'CUIT'
        FieldIndex = 0
      end
      item
        Title = 'Raz'#243'n Social'
        DataField = 'EMPRESA'
        FieldIndex = 0
      end>
  end
  inherited QueryPrint: TQueryPrint
    Detail.Font.Height = -7
    Footer.Font.Height = -7
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
end
