inherited frmBuscarEmbargo: TfrmBuscarEmbargo
  Left = 302
  Top = 208
  Width = 600
  Height = 360
  Caption = 'Buscar Embargo'
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
        FieldName = 'CARATULA'
        Title.Caption = 'Car'#225'tula'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JURISDICCION'
        Title.Caption = 'Jurisdicci'#243'n'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUERO'
        Title.Caption = 'Fuero'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUZGADO'
        Title.Caption = 'Juzgado'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSTANCIA'
        Title.Caption = 'Instancia'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Title.Caption = 'Secretar'#237'a'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANCO'
        Title.Caption = 'Banco'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Title.Caption = 'Cuenta'
        Width = 72
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Importe'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FECHA'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OFICIO'
        Title.Caption = 'Oficio'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 83
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT jt_numerocarpeta carpeta, jt_demandante demandante, jt_de' +
        'mandado demandado, NVL(jt_caratula, em_caratula) caratula,'
      
        '       ju_descripcion jurisdiccion, fu_descripcion fuero, jz_des' +
        'cripcion juzgado, in_descripcion instancia,'
      
        '       sc_descripcion secretaria, ba_nombre banco, cb_numero cue' +
        'nta, em_importe importe, em_fecha fecha, em_oficio oficio,'
      
        '       ee_descripcion estado, em_repetido repetido, em_observaci' +
        'ones observaciones, em_id, TRUNC(em_fechabaja) fechabaja'
      
        '  FROM zba_banco, zcb_cuentabancaria, legales.ljt_juicioentramit' +
        'e, legales.lju_jurisdiccion, legales.lfu_fuero,'
      
        '       legales.ljz_juzgado, legales.lin_instancia, legales.lsc_s' +
        'ecretaria, lee_estadoembargo, lem_embargo'
      ' WHERE ee_id = em_idestado'
      '   AND cb_id = em_idcuentabancaria'
      '   AND ba_id = cb_idbanco'
      '   AND jt_id = em_idjuicio'
      '   AND in_id = jz_idinstancia'
      '   AND ju_id = jt_idjurisdiccion'
      '   AND fu_id = jt_idfuero'
      '   AND jz_id = jt_idjuzgado'
      '   AND sc_id = jt_idsecretaria'
      '   AND em_fechabaja IS NULL')
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
