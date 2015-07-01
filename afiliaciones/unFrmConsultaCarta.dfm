object frmConsultaCarta: TfrmConsultaCarta
  Left = 259
  Top = 177
  Width = 600
  Height = 300
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biMaximize]
  Caption = 'Consulta de Cartas'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    592
    273)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 222
    Width = 586
    Height = 20
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object btnAceptar: TButton
    Left = 516
    Top = 246
    Width = 72
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Aceptar'
    TabOrder = 0
    OnClick = btnAceptarClick
  end
  object tbConsultaCarta: TArtDBGrid
    Left = 3
    Top = 2
    Width = 587
    Height = 234
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = tbConsultaCartaGetCellParams
    FooterBand = False
    TitleHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CA_NROCARTADOC'
        Title.Caption = 'N'#186'. Carta Doc.'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORREO'
        Title.Caption = 'Correo'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_RECEPCIONOK'
        Title.Caption = 'Recepci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHARECEPCION'
        Title.Caption = 'Fecha Recep.'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Tipo Recepci'#243'n'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UIMPRESION'
        Title.Caption = 'Usu. Imp.'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIMPRESION'
        Title.Caption = 'Fecha Imp.'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_USUBAJA'
        Title.Caption = 'Usu. Baja'
        Visible = True
      end>
  end
  object dsConsulta: TDataSource
    DataSet = sdqConsulta
    Left = 44
    Top = 65
  end
  object sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    Left = 16
    Top = 64
  end
end
