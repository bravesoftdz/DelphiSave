inherited frmBuscarJuicio: TfrmBuscarJuicio
  Left = 86
  Top = 167
  Width = 600
  Height = 360
  Caption = 'Buscar Juicio'
  FormStyle = fsNormal
  OldCreateOrder = True
  Position = poOwnerFormCenter
  Visible = False
  OnShow = FSFormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
    Visible = False
  end
  inherited CoolBar: TCoolBar
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbLimpiar: TToolButton
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
    end
  end
  inherited Grid: TArtDBGrid
    Width = 592
    Height = 267
    Columns = <
      item
        Expanded = False
        FieldName = 'CARPETA'
        Title.Caption = 'Carpeta'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDADO'
        Title.Caption = 'Demandado'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEMANDANTE'
        Title.Caption = 'Demandante'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JURISDICCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUERO'
        Title.Caption = 'Fuero'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUZGADO'
        Title.Caption = 'Juzgado'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTANCIA'
        Title.Caption = 'Instancia'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Title.Caption = 'Secretar'#237'a'
        Width = 111
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taCenter
        Title.Caption = 'Importe'
        Width = 74
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT jt_numerocarpeta carpeta, jt_demandante demandante, jt_de' +
        'mandado demandado, jt_caratula caratula,'
      
        '       ju_descripcion jurisdiccion, fu_descripcion fuero, jz_des' +
        'cripcion juzgado, in_descripcion instancia,'
      
        '       sc_descripcion secretaria, jt_importerecursoextraord impo' +
        'rte, null fecha,'
      
        '       ej_descripcion estado, jt_id, TRUNC(jt_fechabaja) fechaba' +
        'ja'
      
        '  FROM legales.ljt_juicioentramite, legales.lju_jurisdiccion, le' +
        'gales.lfu_fuero,'
      
        '       legales.ljz_juzgado, legales.lin_instancia, legales.lsc_s' +
        'ecretaria, legales.lej_estadojuicio'
      ' WHERE ej_id = jt_idestado'
      '   AND in_id = jz_idinstancia'
      '   AND ju_id = jt_idjurisdiccion'
      '   AND fu_id = jt_idfuero'
      '   AND jz_id = jt_idjuzgado'
      '   AND sc_id = jt_idsecretaria'
      '   AND jt_fechabaja IS NULL'
      '   AND jt_importerecursoextraord <> 0'
      '')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxLandscape
    PageSize = psLetter
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
  object ShortCutControl1: TShortCutControl
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
      end>
    Left = 116
    Top = 200
  end
end
