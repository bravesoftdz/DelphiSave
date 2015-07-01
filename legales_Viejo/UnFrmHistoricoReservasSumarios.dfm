object frmHistoricoReservasSumarios: TfrmHistoricoReservasSumarios
  Left = 158
  Top = 201
  Width = 761
  Height = 322
  Caption = 'Hist'#243'rico Reservas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    753
    295)
  PixelsPerInch = 96
  TextHeight = 13
  object cbAbogados: TCoolBar
    Left = 0
    Top = 0
    Width = 753
    Height = 29
    Bands = <
      item
        Control = tbrAbogados
        ImageIndex = -1
        MinHeight = 27
        Width = 749
      end>
    object tbrAbogados: TToolBar
      Left = 9
      Top = 0
      Width = 736
      Height = 27
      BorderWidth = 1
      ButtonWidth = 26
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = dmLegales.ilByN
      Images = dmLegales.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Transparent = True
      object tbImprimirAsignacionAbogados: TToolButton
        Left = 0
        Top = 0
        Hint = 'Imprimir Instancias de Juicio'
        ImageIndex = 4
      end
      object tbSeparador3: TToolButton
        Left = 26
        Top = 0
        Width = 7
        ImageIndex = 6
        Style = tbsSeparator
      end
      object tbSalirAbogadosAsignados: TToolButton
        Left = 33
        Top = 0
        Caption = 'tbSalirAbogadosAsignados'
        ImageIndex = 5
        OnClick = tbSalirAbogadosAsignadosClick
      end
    end
  end
  object dbGridAbogadosJuicio: TDBGrid
    Left = 6
    Top = 33
    Width = 737
    Height = 256
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsReservasEnTramite
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'HS_RESERVACAPITALCALCULADA'
        Title.Caption = 'R.Capital Calc.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HS_RESERVACAPITAL'
        Title.Caption = 'R.Capital'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HS_RESERVAHONORARIOCALCULADA'
        Title.Caption = 'R.Honorarios Calc.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HS_RESERVAHONORARIOS'
        Title.Caption = 'R.Honorarios'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HS_USUARIOAPROBORESERVA'
        Title.Caption = 'Aprob'#243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HS_FECHAAPROBACIONRESERVA'
        Title.Caption = 'Fecha Aprobaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HS_RESERVAEFECTUADA'
        Title.Caption = 'Reserva Efectuada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HS_OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Visible = True
      end>
  end
  object dsReservasEnTramite: TDataSource
    DataSet = sdqHistoricoReservas
    Left = 63
    Top = 216
  end
  object sdqHistoricoReservas: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'select  * from legales.lhS_historicoreservasumario'
      'where hs_idsumario = :IDSUMARIO'
      'order by hs_id desc'
      '')
    Left = 35
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDSUMARIO'
        ParamType = ptInput
      end>
  end
end
