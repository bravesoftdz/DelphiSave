object frmHistoricoEstados: TfrmHistoricoEstados
  Left = 233
  Top = 200
  Width = 646
  Height = 322
  Caption = 'Hist'#243'rico Estados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    638
    295)
  PixelsPerInch = 96
  TextHeight = 13
  object cbAbogados: TCoolBar
    Left = 0
    Top = 0
    Width = 638
    Height = 29
    Bands = <
      item
        Control = tbrAbogados
        ImageIndex = -1
        MinHeight = 27
        Width = 634
      end>
    object tbrAbogados: TToolBar
      Left = 9
      Top = 0
      Width = 621
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
    Width = 622
    Height = 256
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsAbogadosJuicioEnTramite
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
        FieldName = 'HE_FECHAINGRESOESTADO'
        Title.Caption = 'F. Ingreso'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 444
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EJ_ORDEN'
        Title.Caption = 'Orden'
        Visible = True
      end>
  end
  object dsAbogadosJuicioEnTramite: TDataSource
    DataSet = sdqHistoricoEstados
    Left = 63
    Top = 216
  end
  object sdqHistoricoEstados: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT       lej.ej_descripcion, lhe.he_id, lhe.he_idestadojuici' +
        'o,'
      
        '       lhe.he_fechaingresoestado, lhe.he_usualta, lhe.he_fechaal' +
        'ta, lej.EJ_ORDEN'
      
        '  FROM legales.lhe_historicoestadojuicio lhe, legales.lej_estado' +
        'juicio lej'
      ' WHERE ((lej.ej_id = lhe.he_idestadojuicio))'
      '   and he_idjuicioentramite = :IDJUICIOENTRAMITE'
      'order by lhe.he_fechaingresoestado desc'
      ''
      ''
      '')
    Left = 35
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDJUICIOENTRAMITE'
        ParamType = ptInput
        Value = '0'
      end>
  end
end
