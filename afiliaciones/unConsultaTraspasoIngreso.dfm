object frmConsultaTraspasoIngreso: TfrmConsultaTraspasoIngreso
  Left = 354
  Top = 156
  Width = 463
  Height = 210
  Caption = 'Consulta de Eventos de Traspaso Ingreso'
  Color = clBtnFace
  Constraints.MinHeight = 210
  Constraints.MinWidth = 460
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    455
    183)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 132
    Width = 449
    Height = 20
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object btnAceptar: TButton
    Left = 379
    Top = 156
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 0
    OnClick = btnAceptarClick
  end
  object ArtDBGrid: TArtDBGrid
    Left = 0
    Top = 0
    Width = 455
    Height = 146
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = ArtDBGridGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'TI_CODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_DE_EVENTO'
        Title.Caption = 'Evento'
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_FECHA'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_DEUDA'
        Title.Caption = 'Deuda'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_DE_CARTA'
        Title.Caption = 'Tipo de Carta'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TI_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 202
        Visible = True
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 44
    Top = 64
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 16
    Top = 64
  end
end
