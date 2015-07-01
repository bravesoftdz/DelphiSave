inherited frmCustomGridABMDetalle: TfrmCustomGridABMDetalle
  Left = 219
  Top = 150
  Width = 622
  Height = 493
  Caption = 'frmCustomGridABMDetalle'
  Font.Name = 'Tahoma'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 614
  end
  inherited CoolBar: TCoolBar
    Width = 614
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 610
      end>
    inherited ToolBar: TToolBar
      Width = 597
    end
  end
  inherited Grid: TArtDBGrid
    Width = 614
    Height = 392
    TitleFont.Name = 'Tahoma'
  end
  inherited fpAbm: TFormPanel
    Left = 116
    Top = 92
    Width = 485
    Height = 325
    DesignSize = (
      485
      325)
    inherited BevelAbm: TBevel
      Top = 289
      Width = 477
    end
    inherited btnAceptar: TButton
      Left = 330
      Top = 295
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnCancelar: TButton
      Left = 405
      Top = 295
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 485
      Height = 285
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 2
      object pnlBottom: TPanel
        Left = 0
        Top = 132
        Width = 485
        Height = 153
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object cbDetalle: TCoolBar
          Left = 0
          Top = 0
          Width = 485
          Height = 30
          Bands = <
            item
              Control = tbDetalle
              ImageIndex = -1
              MinHeight = 480
              Width = 481
            end>
          object tbDetalle: TToolBar
            Left = 9
            Top = 0
            Width = 468
            Height = 480
            Align = alBottom
            BorderWidth = 1
            Caption = 'ToolBar'
            EdgeBorders = []
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object tbNuevoDetalle: TToolButton
              Left = 0
              Top = 0
              Hint = 'Nuevo (Ctrl+N)'
              ImageIndex = 6
              OnClick = tbNuevoDetalleClick
            end
            object tbModificarDetalle: TToolButton
              Left = 23
              Top = 0
              Hint = 'Modificar (Ctrl+M)'
              Enabled = False
              ImageIndex = 7
              OnClick = tbModificarDetalleClick
            end
            object tbEliminarDetalle: TToolButton
              Left = 46
              Top = 0
              Hint = 'Dar de Baja (Ctrl+Del)'
              Enabled = False
              ImageIndex = 8
              OnClick = tbEliminarDetalleClick
            end
          end
        end
        object GridDetalle: TArtDBGrid
          Left = 0
          Top = 30
          Width = 485
          Height = 123
          Align = alClient
          DataSource = dsConsultaDetalle
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = GridDetalleDblClick
          OnKeyDown = GridDetalleKeyDown
          IniStorage = FormStorage
          OnGetCellParams = GridDetalleGetCellParams
          FooterBand = False
          TitleHeight = 17
        end
      end
    end
  end
  object fpABMDetalle: TFormPanel [4]
    Left = 228
    Top = 108
    Width = 381
    Height = 185
    FormWidth = 0
    FormHeigth = 0
    Position = poOwnerFormCenter
    DesignSize = (
      381
      185)
    object BevelAbmDetalle: TBevel
      Left = 4
      Top = 141
      Width = 377
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object btnAceptarDetalle: TButton
      Left = 222
      Top = 152
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAceptarDetalleClick
    end
    object btnCancelarDetalle: TButton
      Left = 297
      Top = 152
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object sdqConsultaDetalle: TSDQuery
    DatabaseName = 'dbPrincipal'
    AfterOpen = sdqConsultaDetalleAfterOpen
    Left = 24
    Top = 348
  end
  object dsConsultaDetalle: TDataSource
    DataSet = sdqConsultaDetalle
    Left = 52
    Top = 348
  end
end
