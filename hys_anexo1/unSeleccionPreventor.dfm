inherited frmSeleccionPreventor: TfrmSeleccionPreventor
  Left = 206
  Top = 182
  Width = 500
  BorderIcons = []
  Caption = 'Selecci'#243'n de Preventor  Mediante Perfil'
  Constraints.MinWidth = 500
  Font.Name = 'Tahoma'
  FormStyle = fsNormal
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 492
    Height = 109
    object lblPerfil: TLabel
      Left = 12
      Top = 7
      Width = 39
      Height = 13
      Caption = 'Perfiles:'
    end
    object clbPerfiles: TARTCheckListBox
      Left = 55
      Top = 3
      Width = 434
      Height = 102
      Anchors = [akLeft, akTop, akRight]
      Columns = 2
      ItemHeight = 13
      TabOrder = 0
      AutoAjustarColumnas = True
      SQL = 
        'SELECT pf_descripcion as descripcion, pf_id as codigo FROM hys.h' +
        'pf_perfil WHERE pf_usubaja IS NULL UNION ALL SELECT '#39'Sin asignar' +
        #39', -1 FROM dual'
    end
  end
  inherited CoolBar: TCoolBar
    Top = 109
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
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited ToolButton11: TToolButton
        Visible = False
      end
      inherited tbSalir: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 138
    Width = 492
    Height = 150
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'IT_CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IT_NOMBRE'
        Title.Caption = 'Preventor'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTET'
        Title.Caption = 'Cantidad ET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTEP'
        Title.Caption = 'Cantidad EP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTCO'
        Title.Caption = 'Cantidad CO'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTGB'
        Title.Caption = 'Cantidad GB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTEAD'
        Title.Caption = 'Cantidad EAD'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTEADS'
        Title.Caption = 'Cantidad EADS'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDADTOTAL'
        Title.Caption = 'Cantidad Total'
        Width = 78
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 288
    Width = 492
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      492
      29)
    object btnAceptar: TButton
      Left = 339
      Top = 3
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
      OnClick = btnAceptarClick
    end
    object btnCancelar: TButton
      Left = 414
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object pnlBottom: TPanel
      Left = 2
      Top = 4
      Width = 335
      Height = 24
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    AfterClose = sdqConsultaAfterClose
    SQL.Strings = (
      'SELECT   it_codigo, it_nombre,'
      '         (SELECT COUNT (*)'
      '            FROM art.pit_firmantes pitet,'
      '                 hys.hep_estabporpreventor hepet,'
      '                 hys.hte_tipoempresaprev hteet'
      '           WHERE pitet.it_codigo = a.it_codigo'
      '             AND pitet.it_id = hepet.ep_idfirmante'
      '             AND hepet.ep_fechabaja IS NULL'
      '             AND hepet.ep_idtipoestabprev = hteet.te_id'
      '             AND te_codigo = '#39'ET'#39') AS cantet,'
      '         (SELECT COUNT (*)'
      '            FROM art.pit_firmantes pitet,'
      '                 hys.hep_estabporpreventor hepet,'
      '                 hys.hte_tipoempresaprev hteet'
      '           WHERE pitet.it_codigo = a.it_codigo'
      '             AND pitet.it_id = hepet.ep_idfirmante'
      '             AND hepet.ep_fechabaja IS NULL'
      '             AND hepet.ep_idtipoestabprev = hteet.te_id'
      '             AND te_codigo = '#39'CO'#39') AS cantco,'
      '         (SELECT COUNT (*)'
      '            FROM art.pit_firmantes pitet,'
      '                 hys.hep_estabporpreventor hepet,'
      '                 hys.hte_tipoempresaprev hteet'
      '           WHERE pitet.it_codigo = a.it_codigo'
      '             AND pitet.it_id = hepet.ep_idfirmante'
      '             AND hepet.ep_fechabaja IS NULL'
      '             AND hepet.ep_idtipoestabprev = hteet.te_id'
      '             AND te_codigo = '#39'GB'#39') AS cantgb,'
      '         (SELECT COUNT (*)'
      '            FROM art.pit_firmantes pitet,'
      '                 hys.hep_estabporpreventor hepet,'
      '                 hys.hte_tipoempresaprev hteet'
      '           WHERE pitet.it_codigo = a.it_codigo'
      '             AND pitet.it_id = hepet.ep_idfirmante'
      '             AND hepet.ep_fechabaja IS NULL'
      '             AND hepet.ep_idtipoestabprev = hteet.te_id'
      '             AND te_codigo = '#39'EP'#39') AS cantep,'
      '             (SELECT COUNT (*)'
      '            FROM art.pit_firmantes pitet,'
      '                 hys.hep_estabporpreventor hepet,'
      '                 hys.hte_tipoempresaprev hteet'
      '           WHERE pitet.it_codigo = a.it_codigo'
      '             AND pitet.it_id = hepet.ep_idfirmante'
      '             AND hepet.ep_fechabaja IS NULL'
      '             AND hepet.ep_idtipoestabprev = hteet.te_id'
      '             AND te_codigo = '#39'EAD'#39') AS cantead,'
      '             (SELECT COUNT (*)'
      '            FROM art.pit_firmantes pitet,'
      '                 hys.hep_estabporpreventor hepet,'
      '                 hys.hte_tipoempresaprev hteet'
      '           WHERE pitet.it_codigo = a.it_codigo'
      '             AND pitet.it_id = hepet.ep_idfirmante'
      '             AND hepet.ep_fechabaja IS NULL'
      '             AND hepet.ep_idtipoestabprev = hteet.te_id'
      '             AND te_codigo = '#39'EADS'#39') AS canteads,             '
      '         COUNT (*) cantidadtotal'
      '    FROM art.pit_firmantes a,'
      '         hys.hpf_perfil,'
      '         hys.hep_estabporpreventor,'
      '         hys.hte_tipoempresaprev'
      '   WHERE it_fechabaja IS NULL'
      '     AND it_idperfil = pf_id(+)'
      '     AND it_id = ep_idfirmante'
      '     AND ep_fechabaja IS NULL'
      '     AND pf_fechabaja IS NULL'
      '     AND ep_idtipoestabprev = te_id'
      'GROUP BY it_codigo, it_nombre'
      'ORDER BY 1,4 DESC'
      '')
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
