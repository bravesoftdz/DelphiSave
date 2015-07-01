inherited frmFormulasCalculoReservaJuicios: TfrmFormulasCalculoReservaJuicios
  Left = 203
  Top = 106
  Width = 684
  Caption = 'F'#243'rmulas para el Calculo de Reservas de Juicios'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 676
    Height = 3
  end
  inherited CoolBar: TCoolBar
    Top = 3
    Width = 676
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 672
      end>
    inherited ToolBar: TToolBar
      Width = 659
      HotImages = frmPrincipal.ilByN
      Images = frmPrincipal.ilColor
    end
  end
  inherited Grid: TArtDBGrid
    Top = 32
    Width = 676
    Height = 407
    Columns = <
      item
        Expanded = False
        FieldName = 'RC_DESCRIPCION'
        Title.Caption = 'Reclamo'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_DESCRIPCION'
        Title.Caption = 'Tipo Juicio'
        Width = 184
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FR_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FR_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FR_FECHAVIGENCIA'
        Title.Caption = 'Vigencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FR_IDTIPOJUICIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FR_IDRECLAMO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FR_FECHAVIGENCIAHASTA'
        Title.Caption = 'Vigencia Hasta'
        Width = 81
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 56
    Top = 48
    Width = 529
    Height = 385
    inherited BevelAbm: TBevel
      Top = 349
      Width = 521
    end
    inherited btnAceptar: TButton
      Left = 371
      Top = 355
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 449
      Top = 355
      TabOrder = 3
    end
    object pnFormulas: TPanel
      Left = 0
      Top = 111
      Width = 529
      Height = 232
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object tbEvToolBar: TToolBar
        Left = 0
        Top = 0
        Width = 529
        Height = 29
        BorderWidth = 1
        ButtonHeight = 24
        Caption = 'tbarEventosABM'
        EdgeBorders = []
        Flat = True
        HotImages = ilByN
        Images = ilColor
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object tbSeparador0: TToolButton
          Left = 0
          Top = 0
          Width = 8
          Caption = 'tbSeparador0'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbLimpiarFormula: TToolButton
          Left = 8
          Top = 0
          Hint = 'Limpiar Formula'
          ImageIndex = 1
        end
        object tbSeparador1: TToolButton
          Left = 31
          Top = 0
          Width = 8
          Caption = 'ToolButton6'
          ImageIndex = 5
          Style = tbsSeparator
          Visible = False
        end
        object tbChequearConsulta: TToolButton
          Left = 39
          Top = 0
          Hint = 'Comprobar Sintaxis'
          ImageIndex = 19
          OnClick = tbChequearConsultaClick
        end
        object tbSeparador2: TToolButton
          Left = 62
          Top = 0
          Width = 8
          Caption = 'tbSeparador2'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object tbAgregarCampo: TToolButton
          Left = 70
          Top = 0
          Hint = 'Agregar Campo'
          Caption = 'tbAgregarCampo'
          DropdownMenu = pmnuCampos
          ImageIndex = 16
          Style = tbsDropDown
        end
        object Label1: TLabel
          Left = 106
          Top = 0
          Width = 19
          Height = 24
          AutoSize = False
        end
        object Label2: TLabel
          Left = 125
          Top = 0
          Width = 211
          Height = 24
          AutoSize = False
          Caption = 
            'Utilizar el par'#225'metro <"Valor"> para calcular el valor de la Res' +
            'erva'
          WordWrap = True
        end
      end
      object pcFormulas: TPageControl
        Left = 0
        Top = 29
        Width = 529
        Height = 203
        ActivePage = tsCalculoReservaCapital
        Align = alClient
        TabOrder = 1
        object tsCalculoReservaCapital: TTabSheet
          Caption = 'Reserva Capital'
          object mwReservaCapital: TmwCustomEdit
            Left = 0
            Top = 0
            Width = 521
            Height = 175
            Cursor = crIBeam
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            GutterColor = clBtnFace
            GutterWidth = 30
            HighLighter = mwSqlSynSql
            Keystrokes = <
              item
                ShortCut = 38
                Command = ecUp
              end
              item
                ShortCut = 8230
                Command = ecSelUp
              end
              item
                ShortCut = 16422
                Command = ecScrollUp
              end
              item
                ShortCut = 40
                Command = ecDown
              end
              item
                ShortCut = 8232
                Command = ecSelDown
              end
              item
                ShortCut = 16424
                Command = ecScrollDown
              end
              item
                ShortCut = 37
                Command = ecLeft
              end
              item
                ShortCut = 8229
                Command = ecSelLeft
              end
              item
                ShortCut = 16421
                Command = ecWordLeft
              end
              item
                ShortCut = 24613
                Command = ecSelWordLeft
              end
              item
                ShortCut = 39
                Command = ecRight
              end
              item
                ShortCut = 8231
                Command = ecSelRight
              end
              item
                ShortCut = 16423
                Command = ecWordRight
              end
              item
                ShortCut = 24615
                Command = ecSelWordRight
              end
              item
                ShortCut = 34
                Command = ecPageDown
              end
              item
                ShortCut = 8226
                Command = ecSelPageDown
              end
              item
                ShortCut = 16418
                Command = ecPageBottom
              end
              item
                ShortCut = 24610
                Command = ecSelPageBottom
              end
              item
                ShortCut = 33
                Command = ecPageUp
              end
              item
                ShortCut = 8225
                Command = ecSelPageUp
              end
              item
                ShortCut = 16417
                Command = ecPageTop
              end
              item
                ShortCut = 24609
                Command = ecSelPageTop
              end
              item
                ShortCut = 36
                Command = ecLineStart
              end
              item
                ShortCut = 8228
                Command = ecSelLineStart
              end
              item
                ShortCut = 16420
                Command = ecEditorTop
              end
              item
                ShortCut = 24612
                Command = ecSelEditorTop
              end
              item
                ShortCut = 35
                Command = ecLineEnd
              end
              item
                ShortCut = 8227
                Command = ecSelLineEnd
              end
              item
                ShortCut = 16419
                Command = ecEditorBottom
              end
              item
                ShortCut = 24611
                Command = ecSelEditorBottom
              end
              item
                ShortCut = 45
                Command = ecToggleMode
              end
              item
                ShortCut = 16429
                Command = ecCopy
              end
              item
                ShortCut = 8237
                Command = ecPaste
              end
              item
                ShortCut = 46
                Command = ecDeleteChar
              end
              item
                ShortCut = 8238
                Command = ecCut
              end
              item
                ShortCut = 8
                Command = ecDeleteLastChar
              end
              item
                ShortCut = 16392
                Command = ecDeleteLastWord
              end
              item
                ShortCut = 32776
                Command = ecUndo
              end
              item
                ShortCut = 40968
                Command = ecRedo
              end
              item
                ShortCut = 13
                Command = ecLineBreak
              end
              item
                ShortCut = 16449
                Command = ecSelectAll
              end
              item
                ShortCut = 16451
                Command = ecCopy
              end
              item
                ShortCut = 24649
                Command = ecBlockIndent
              end
              item
                ShortCut = 16461
                Command = ecLineBreak
              end
              item
                ShortCut = 16462
                Command = ecInsertLine
              end
              item
                ShortCut = 16468
                Command = ecDeleteWord
              end
              item
                ShortCut = 24661
                Command = ecBlockUnindent
              end
              item
                ShortCut = 16470
                Command = ecPaste
              end
              item
                ShortCut = 16472
                Command = ecCut
              end
              item
                ShortCut = 16473
                Command = ecDeleteLine
              end
              item
                ShortCut = 24665
                Command = ecDeleteEOL
              end
              item
                ShortCut = 16474
                Command = ecUndo
              end
              item
                ShortCut = 24666
                Command = ecRedo
              end
              item
                ShortCut = 16432
                Command = ecGotoMarker0
              end
              item
                ShortCut = 16433
                Command = ecGotoMarker1
              end
              item
                ShortCut = 16434
                Command = ecGotoMarker2
              end
              item
                ShortCut = 16435
                Command = ecGotoMarker3
              end
              item
                ShortCut = 16436
                Command = ecGotoMarker4
              end
              item
                ShortCut = 16437
                Command = ecGotoMarker5
              end
              item
                ShortCut = 16438
                Command = ecGotoMarker6
              end
              item
                ShortCut = 16439
                Command = ecGotoMarker7
              end
              item
                ShortCut = 16440
                Command = ecGotoMarker8
              end
              item
                ShortCut = 16441
                Command = ecGotoMarker9
              end
              item
                ShortCut = 24624
                Command = ecSetMarker0
              end
              item
                ShortCut = 24625
                Command = ecSetMarker1
              end
              item
                ShortCut = 24626
                Command = ecSetMarker2
              end
              item
                ShortCut = 24627
                Command = ecSetMarker3
              end
              item
                ShortCut = 24628
                Command = ecSetMarker4
              end
              item
                ShortCut = 24629
                Command = ecSetMarker5
              end
              item
                ShortCut = 24630
                Command = ecSetMarker6
              end
              item
                ShortCut = 24631
                Command = ecSetMarker7
              end
              item
                ShortCut = 24632
                Command = ecSetMarker8
              end
              item
                ShortCut = 24633
                Command = ecSetMarker9
              end>
            LeftChar = 1
            MaxUndo = 10
            ParentColor = False
            ParentFont = False
            ReadOnly = False
            TabOrder = 0
            TopLine = 1
          end
        end
        object tsCalculoReservaHonorarios: TTabSheet
          Caption = 'Reserva Honorario'
          ImageIndex = 1
          object mwReservaHonorarios: TmwCustomEdit
            Left = 0
            Top = 0
            Width = 521
            Height = 175
            Cursor = crIBeam
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            GutterColor = clBtnFace
            GutterWidth = 30
            HighLighter = mwSqlSynSql2
            Keystrokes = <
              item
                ShortCut = 38
                Command = ecUp
              end
              item
                ShortCut = 8230
                Command = ecSelUp
              end
              item
                ShortCut = 16422
                Command = ecScrollUp
              end
              item
                ShortCut = 40
                Command = ecDown
              end
              item
                ShortCut = 8232
                Command = ecSelDown
              end
              item
                ShortCut = 16424
                Command = ecScrollDown
              end
              item
                ShortCut = 37
                Command = ecLeft
              end
              item
                ShortCut = 8229
                Command = ecSelLeft
              end
              item
                ShortCut = 16421
                Command = ecWordLeft
              end
              item
                ShortCut = 24613
                Command = ecSelWordLeft
              end
              item
                ShortCut = 39
                Command = ecRight
              end
              item
                ShortCut = 8231
                Command = ecSelRight
              end
              item
                ShortCut = 16423
                Command = ecWordRight
              end
              item
                ShortCut = 24615
                Command = ecSelWordRight
              end
              item
                ShortCut = 34
                Command = ecPageDown
              end
              item
                ShortCut = 8226
                Command = ecSelPageDown
              end
              item
                ShortCut = 16418
                Command = ecPageBottom
              end
              item
                ShortCut = 24610
                Command = ecSelPageBottom
              end
              item
                ShortCut = 33
                Command = ecPageUp
              end
              item
                ShortCut = 8225
                Command = ecSelPageUp
              end
              item
                ShortCut = 16417
                Command = ecPageTop
              end
              item
                ShortCut = 24609
                Command = ecSelPageTop
              end
              item
                ShortCut = 36
                Command = ecLineStart
              end
              item
                ShortCut = 8228
                Command = ecSelLineStart
              end
              item
                ShortCut = 16420
                Command = ecEditorTop
              end
              item
                ShortCut = 24612
                Command = ecSelEditorTop
              end
              item
                ShortCut = 35
                Command = ecLineEnd
              end
              item
                ShortCut = 8227
                Command = ecSelLineEnd
              end
              item
                ShortCut = 16419
                Command = ecEditorBottom
              end
              item
                ShortCut = 24611
                Command = ecSelEditorBottom
              end
              item
                ShortCut = 45
                Command = ecToggleMode
              end
              item
                ShortCut = 16429
                Command = ecCopy
              end
              item
                ShortCut = 8237
                Command = ecPaste
              end
              item
                ShortCut = 46
                Command = ecDeleteChar
              end
              item
                ShortCut = 8238
                Command = ecCut
              end
              item
                ShortCut = 8
                Command = ecDeleteLastChar
              end
              item
                ShortCut = 16392
                Command = ecDeleteLastWord
              end
              item
                ShortCut = 32776
                Command = ecUndo
              end
              item
                ShortCut = 40968
                Command = ecRedo
              end
              item
                ShortCut = 13
                Command = ecLineBreak
              end
              item
                ShortCut = 16449
                Command = ecSelectAll
              end
              item
                ShortCut = 16451
                Command = ecCopy
              end
              item
                ShortCut = 24649
                Command = ecBlockIndent
              end
              item
                ShortCut = 16461
                Command = ecLineBreak
              end
              item
                ShortCut = 16462
                Command = ecInsertLine
              end
              item
                ShortCut = 16468
                Command = ecDeleteWord
              end
              item
                ShortCut = 24661
                Command = ecBlockUnindent
              end
              item
                ShortCut = 16470
                Command = ecPaste
              end
              item
                ShortCut = 16472
                Command = ecCut
              end
              item
                ShortCut = 16473
                Command = ecDeleteLine
              end
              item
                ShortCut = 24665
                Command = ecDeleteEOL
              end
              item
                ShortCut = 16474
                Command = ecUndo
              end
              item
                ShortCut = 24666
                Command = ecRedo
              end
              item
                ShortCut = 16432
                Command = ecGotoMarker0
              end
              item
                ShortCut = 16433
                Command = ecGotoMarker1
              end
              item
                ShortCut = 16434
                Command = ecGotoMarker2
              end
              item
                ShortCut = 16435
                Command = ecGotoMarker3
              end
              item
                ShortCut = 16436
                Command = ecGotoMarker4
              end
              item
                ShortCut = 16437
                Command = ecGotoMarker5
              end
              item
                ShortCut = 16438
                Command = ecGotoMarker6
              end
              item
                ShortCut = 16439
                Command = ecGotoMarker7
              end
              item
                ShortCut = 16440
                Command = ecGotoMarker8
              end
              item
                ShortCut = 16441
                Command = ecGotoMarker9
              end
              item
                ShortCut = 24624
                Command = ecSetMarker0
              end
              item
                ShortCut = 24625
                Command = ecSetMarker1
              end
              item
                ShortCut = 24626
                Command = ecSetMarker2
              end
              item
                ShortCut = 24627
                Command = ecSetMarker3
              end
              item
                ShortCut = 24628
                Command = ecSetMarker4
              end
              item
                ShortCut = 24629
                Command = ecSetMarker5
              end
              item
                ShortCut = 24630
                Command = ecSetMarker6
              end
              item
                ShortCut = 24631
                Command = ecSetMarker7
              end
              item
                ShortCut = 24632
                Command = ecSetMarker8
              end
              item
                ShortCut = 24633
                Command = ecSetMarker9
              end>
            LeftChar = 1
            MaxUndo = 10
            ParentColor = False
            ParentFont = False
            ReadOnly = False
            TabOrder = 0
            TopLine = 1
          end
        end
      end
    end
    object pnCabecera: TPanel
      Left = 0
      Top = 0
      Width = 529
      Height = 111
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        529
        111)
      object lblTipoJuicio: TLabel
        Left = 11
        Top = 40
        Width = 54
        Height = 13
        Caption = 'Tipo Juicio:'
      end
      object lblReclamo: TLabel
        Left = 11
        Top = 63
        Width = 45
        Height = 13
        Caption = 'Reclamo:'
      end
      object lblFechaAsignacion: TLabel
        Left = 11
        Top = 88
        Width = 87
        Height = 13
        Caption = 'F.Vigencia Desde:'
      end
      object lbConcurso: TLabel
        Left = 337
        Top = 87
        Width = 84
        Height = 13
        Caption = 'F.Vigencia Hasta:'
      end
      object lblDescripcion: TLabel
        Left = 11
        Top = 16
        Width = 59
        Height = 13
        Caption = 'Descripci'#243'n:'
      end
      inline fraTipoJuicio: TfraCodigoDescripcion
        Left = 101
        Top = 35
        Width = 415
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        inherited cmbDescripcion: TArtComboBox
          Width = 350
        end
        inherited edCodigo: TPatternEdit
          Width = 61
        end
      end
      inline fraReclamo: TfraCodigoDescripcion
        Left = 101
        Top = 59
        Width = 415
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        inherited cmbDescripcion: TArtComboBox
          Width = 350
        end
      end
      object edFechaVigenciaDesde: TDateComboBox
        Left = 102
        Top = 84
        Width = 88
        Height = 21
        Weekends = [Sun, Sat]
        TabOrder = 3
      end
      object edFechaVigenciaHasta: TDateComboBox
        Left = 426
        Top = 83
        Width = 88
        Height = 21
        Weekends = [Sun, Sat]
        TabOrder = 4
      end
      object edDescripcion: TEdit
        Left = 102
        Top = 13
        Width = 409
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        TabOrder = 0
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      
        'SELECT lrc.rc_descripcion, ltj.tj_descripcion, lfr.fr_id, lfr.fr' +
        '_descripcion,'
      
        '       lfr.fr_fechavigencia, lfr.fr_fechavigenciahasta, lfj.fj_i' +
        'dtipojuicio,'
      
        '       lfj.fj_idreclamo, lfr.fr_usualta, lfr.fr_fechaalta, lfr.f' +
        'r_usumodif,'
      '       lfr.fr_fechamodif, lfr.fr_usubaja, lfr.fr_fechabaja,'
      
        '       fr_formulareservacapital, fr_formulareservahonorario, lfj' +
        '.fj_id'
      '  FROM legales.lfr_formulareserva lfr,'
      '       legales.ltj_tipojuicio ltj,'
      '       legales.lrc_reclamo lrc,'
      '       legales.lfj_formulareservajuicio lfj'
      ' WHERE ( (lfj.fj_idformulareserva = lfr.fr_id) AND '
      
        '        (ltj.tj_id(+) = lfj.fj_idtipojuicio) AND (lrc.rc_id(+) =' +
        ' lfj.fj_idreclamo)'
      '        )'
      '')
  end
  object ilColor: TImageList
    Left = 408
    Top = 84
    Bitmap = {
      494C010118001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000009C0000009C0000009C0000009C0000009C0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C60000009C00C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF00000000000000000000000000000000000000
      000000000000FF63000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000031000000
      9C000000CE000000CE000000CE000000CE000000CE000000CE0000009C000000
      9C00000084000000000000000000000000000000000000000000000000000000
      000000000000848484009CFFFF00CE31000000009C000000FF0000009C00C6C6
      C600000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF0000000000000000000000000000000000000000000000
      000000000000FF630000FF630000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000084000000CE003100
      FF003100FF003100FF003100FF003100FF003100FF003100FF000000CE000000
      CE0000009C000000840000000000000000000000000000000000000000008484
      8400C6C6C60084848400FFFFFF0000009C000000FF000000CE0000009C00C6C6
      C60000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF6300000000000000000000000000000000
      00000000000000000000000000000000000000000000000084000063FF003131
      FF003100FF003100FF003100FF003100FF003100FF003100FF003100FF003100
      FF000000CE0000009C0000000000000000000000000000000000000000008484
      84009CFFFF008484840000009C00319CFF000000CE00FF0000000000CE000000
      9C0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF9C3100FF633100FF63000000000000000000000000
      000000000000000000000000000000000000000084006363FF000031FF003100
      FF00CECEFF00FFFFFF00CECEFF003100FF003100FF00CECEFF00FFFFFF00CECE
      FF000000CE0000009C0000009C00000000000000000084848400C6C6C6008484
      8400FFFFFF00848484000000CE000000CE00FFFFFF009CFFFF000000CE000000
      9C00000000000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF003131310000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FF9C3100FF633100FF630000000000000000
      000000000000000000000000000000000000000084006363FF003163FF003100
      FF003100FF00CECEFF00FFFFFF00CE9CFF00CE9CFF00FFFFFF00CECEFF003100
      FF003100FF000000CE0000009C000000000000000000848484009CFFFF008484
      84009CFFFF00848484009CFFFF00FF633100FF633100FF6331009CFFFF000000
      CE0000009C0000000000000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C60000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FFCE3100FFCE3100FF633100FF6331000000
      000000000000000000000000000000000000000084006363FF003163FF003100
      FF003100FF003100FF00CE9CFF00FFFFFF00FFFFFF00CE9CFF003100FF003100
      FF003100FF000000CE0000009C00000000000000000084848400FFFFFF008484
      8400FFFFFF0084848400FFFFFF009CFFFF00FFFFFF009CFFFF00848484000000
      CE0000009C000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF0031313100000000000000000000000000000000000000
      000000000000FF9C3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF6331000000
      000000000000000000000000000000000000000084006363FF003163FF003131
      FF003100FF003100FF00CE9CFF00FFFFFF00FFFFFF00CE9CFF003100FF003100
      FF003100FF000000CE0000009C000000000000000000848484009CFFFF008484
      84009CFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C600000000000000000000000000000000000000
      000000000000FFCE3100FFCE3100FFFF9C00FFFFCE00FF633100000000000000
      000000000000000000000000000000000000000084006363FF00319CFF003131
      FF003100FF00CECEFF00FFFFFF00CE9CFF00CE9CFF00FFFFFF00CECEFF003100
      FF003100FF000000CE0000009C00000000000000000084848400FFFFFF008484
      8400FFFFFF008484840084848400848484008484840084848400848484000000
      00000000CE0000009C00000000000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131000000000000000000000000000000
      000000000000FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      000000000000000000000000000000000000000084006363CE00319CFF000063
      FF00C6D6EF00FFFFFF00CECEFF003100FF003100FF00CECEFF00FFFFFF00CECE
      FF003100FF000000CE0000009C000000000000000000848484009CFFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000000000000000
      0000000000000000CE0000009C000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600313131000000000000000000000000000000
      000000000000FFCE3100FFFFCE00FF6331000000000000000000000000000000
      00000000000000000000000000000000000000000000000084006363FF003163
      FF000063FF003100FF003100FF003100FF003100FF003100FF003100FF003100
      FF003100FF000000CE0000000000000000000000000084848400FFFFFF008484
      8400848484008484840084848400848484008484840000000000000000000000
      000000000000000000000000CE0000009C0000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C6003131310000000000000000000000000000000000000000000000
      000000000000FFCE3100FF9C6300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000084003163CE00319C
      FF003163FF000063FF003131FF003131FF003100FF003100FF003100FF003100
      FF003100FF0000009C0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      00000000000000000000000000000000CE000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      1800636363000000000000000000000000000000000000000000000000000000
      000000000000FFCE310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084003163
      CE006363FF00319CFF00319CFF003163FF000031FF003100FF003100FF003100
      FF0000009C000000310000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084006363CE006363FF006363FF006363FF005252FF000000CE000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE0000009C000000FF000000CE0000009C00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000006363009CFF
      FF00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000009C00319CFF000000CE009CFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      8400003131000000000000000000000000000000000000000000006363009CFF
      FF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE3100000000CE000000CE00CE310000CE3100000000CE000000
      9C00000000000000000000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF000084840000313100000000000000000000000000006363009CFFFF0000CE
      FF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF000000
      CE0000009C00000000000000000000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF0000848400003131000000000000000000006363009CFFFF009CFF
      FF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF000000
      CE0000009C000000000000000000000000001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF000084840000313100006363009CFFFF00CEFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF000000000000CEFF00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000000CE0000009C0000000000000000001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      310000313100003131000031310000313100006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF0000000000009CCE00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE000000CE0000009C0000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300009CCE0000CEFF00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000CE0000009C00000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000006363009CFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE0000000000000000000000CE0000009C000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000006363009CFFFF00CEFF
      FF0000CEFF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      00000000000000000000000000000000CE000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000006363009CFFFF0000CE
      FF00CEFFFF0000CEFF009CFFFF0000CEFF009CCECE0000636300006363000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000006363009CFF
      FF009CFFFF009CFFFF009CFFFF009CCECE000063630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031310000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000084840010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF009CFFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000009C9C0000848400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000CECE00009C9C00008484001010
      1000000000000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001010100000FFFF0000CECE00009C9C000084
      8400101010000000000000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000031310010101000101010001010
      10001010100010101000101010001010100000FFFF0000FFFF0000CECE00009C
      9C00008484001010100000000000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000031310000848400008484000084
      84000084840000848400008484000084840031FFFF0000FFFF0000FFFF0000CE
      CE00009C9C000084840010101000000000000000000000000000000000000000
      000000000000101010000084840063FFFF00F7FFFF00CEFFFF00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000031310063FFFF0063FFFF0063FF
      FF0063FFFF0063FFFF0063FFFF0063FFFF0063FFFF0031FFFF0000FFFF0000FF
      FF0000CECE00009C9C0000848400101010001010100010101000101010001010
      100010101000101010000084840063FFFF00F7FFFF00CEFFFF00003131000031
      31000031310000313100003131000031310000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C0000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C000000000000000000003131009CFFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF0000FFFF0000CECE0000848400003131001010100000848400009C9C0000CE
      CE0000FFFF0000FFFF0031FFFF0063FFFF00F7FFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF0000848400003131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C000000000000313100CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00F7FFFF0031FF
      FF0000FFFF00008484000031310000000000000000001010100000848400009C
      9C0000CECE0000FFFF0000FFFF0031FFFF00F7FFFF00CEFFFF00F7FFFF00CEFF
      FF00CEFFFF000084840000313100000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE0000009C000031310000313100003131000031
      310000313100003131000031310000313100CEFFFF00F7FFFF00CEFFFF0031FF
      FF00008484000031310000000000000000000000000000000000101010000084
      8400009C9C0000CECE0000FFFF0000FFFF00F7FFFF00F7FFFF00CEFFFF00CEFF
      FF00008484000031310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000CE000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00CEFFFF000084
      8400003131000000000000000000000000000000000000000000000000001010
      100000848400009C9C0000CECE0000FFFF00F7FFFF0031FFFF0031FFFF000084
      84000031310000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF00CEFFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100000848400009C9C0000CECE0000FFFF0000FFFF00008484000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100CEFFFF0000848400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000848400009C9C0000CECE0000848400003131000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000008484000084840000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      000000000000000000000000000000000000000000000000000000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000FF000000
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C00000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE0000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE0000000000000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C000000000000000000000000000000000084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600313131003939390000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600313131003939390000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF633100840000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60031313100393939004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF31310084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0031313100393939004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF63630084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE003131FF00FF00FF00C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D6009CFF9C0000FF0000D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C6007373730084848400000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D60084848400848484009CFFFF009CFFFF000000
      0000DEDEDE00000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00848484009CFFFF009CFFFF009CFFFF00CEFFFF00CEFF
      FF00000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000084848400848484009CFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00F7FFFF00F7FFFF0000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C000000000000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002942420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000018180000FFFF0063A5A50031525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008400000084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000FFFF0000ADAD0000F7F70000A5A500183131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      0000000000000073730000A5A50000FFFF0000DEDE0000D6D600A5BDBD000018
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      00008400000084000000848484000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00003939390000CECE0000F7F70000DEDE0000CECE0000F7F70010B5B50000E7
      E700294A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000031310000EFEF0000CECE0000D6D60000EFEF0000C6C60010FFFF004AC6
      C60063BDBD003152520000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C31000000000000000000000000000000000000BDA5
      A500005252006BD6D60000DEDE0000FFFF0000BDBD0010FFFF005AB5B50000EF
      EF0000E7E70018CECE0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C6008484840000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000008C00
      0000A54A0000004242009CCECE000094940000FFFF0052BDBD0000F7F70000F7
      F7007BDEDE00005A5A0021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000BD9C9C00FFFF
      0000F7F731008C4A4A001042420000FFFF0039CECE0000E7E70018DEDE0010B5
      B500003131003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE630000000000000000000000000000BD9C9C00FFFF
      0000B5B58C00C69473007B310000004A4A0029C6C60031848400004242005252
      5200000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C31000000000000000000C6BDBD00B5631000FFFF
      F700BDADAD008473000084000000942121002121210021212100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C6008484840000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000C6841000FFFFE7008C8C
      2100B5848400C6B5B500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C600848484000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE6300000000000094393900F7F76B009C843900AD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF000000000084848400000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE6300000000000000000000943939007B7B0000AD6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      00008400000000000000000000000000000084848400FFFFFF00C6C6C6008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFF18FFFFF81FF807FC00F3FFE007
      F807F000F1FFC003E007C001F0FF8001E007C003F07F80018007C003F03F0000
      80078003F01F000080070001F00F000080078001F00F000080030000F01F0000
      80130000F03F000080390000F07F8001807C0001F0FF800180FE8003F1FFC003
      81FFC007F3FFE007FFFFE00FFFFFF81FFE7FFFFFFFFFFFBFFC3FFFFFFFFF8007
      F81FE000FFFF8007F00FC000FFFF8007E007C000718E8007C00380003BDC8007
      800180009BD9800700000000CBD3800300000000CBD38003F81F00009BD98001
      F81F80003BDC8004F81F8000718E8006F81F8000FFFF800FF81FC07FFFFF801F
      F81FE0FFFFFF803FF81FFFFFFFFFFFFF8001FFBFFE7FF81FFFFF001FFE3FF81F
      8001001FFE1FF81FFFFF0007FE0FF81F80010007FE07F81F75D600070003F81F
      000000070001F81F7416000300000000000100030000000055D9000100018001
      000000040003C00377760006FE07E00780010007FE0FF00FFFFF0007FE1FF81F
      8001C007FE3FFC3FFFFFC007FE7FFE7FDFFFFFFFFFFFFFFF8002FFFFFFFF8001
      80030000F00FFFFF80010000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0070000FC3FFE7F80030000F81FFFFF
      001D0000F00F80019FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000000E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00F003B9F700000600E00181F700000300E001FFF700000000C00388F70000
      0000C00F9CF700000000803FC1F70000000081FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object ilByN: TImageList
    Left = 436
    Top = 84
    Bitmap = {
      494C010118001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400B5B5B500B5B5B500B5B5B5005A5A5A00B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B500424242000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000031004A4A
      4A006363630063636300636363006363630063636300636363004A4A4A004A4A
      4A00636363000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600525252005A5A5A008484840052525200B5B5
      B500000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C60042424200000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A00000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00737373008484
      8400848484008484840084848400848484008484840084848400737373007373
      7300636363006363630000000000000000000000000000000000000000008484
      8400B5B5B50084848400E7E7E7005A5A5A00848484006363630052525200B5B5
      B50000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B5004242420000000000000000000000000000000000000000000000
      0000000000005A5A5A0073737300848484000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00949494009494
      9400848484008484840084848400848484008484840084848400848484008484
      8400636363004A4A4A0000000000000000000000000000000000000000008484
      8400C6C6C600848484005A5A5A00848484006363630063636300636363005252
      520000000000000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      00000000000073737300B5B5B500848484008484840000000000000000000000
      0000000000000000000000000000000000004A4A4A0094949400949494009494
      9400CECECE00E7E7E700CECECE008484840084848400CECECE00E7E7E700CECE
      CE00636363004A4A4A004A4A4A00000000000000000084848400B5B5B5008484
      8400E7E7E700848484006363630063636300E7E7E700C6C6C600636363005252
      5200000000000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF003131310000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B5008484840094949400000000000000
      0000000000000000000000000000000000004A4A4A0094949400848484009494
      940094949400CECECE00E7E7E700C6C6C600C6C6C600E7E7E700CECECE009C9C
      9C009C9C9C00636363004A4A4A00000000000000000084848400C6C6C6008484
      8400C6C6C60084848400C6C6C600848484008484840084848400C6C6C6006363
      63005252520000000000000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C60000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C000000
      0000000000000000000000000000000000004A4A4A0094949400848484009494
      94009494940094949400C6C6C600E7E7E700E7E7E700C6C6C6009C9C9C009C9C
      9C009C9C9C00636363004A4A4A00000000000000000084848400E7E7E7008484
      8400E7E7E70084848400E7E7E700C6C6C600E7E7E700C6C6C600848484006363
      6300525252000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF0031313100000000000000000000000000000000000000
      000000000000B5B5B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C000000
      0000000000000000000000000000000000004A4A4A0094949400848484009494
      94009494940094949400C6C6C600E7E7E700E7E7E700C6C6C6009C9C9C009C9C
      9C009C9C9C00636363004A4A4A00000000000000000084848400C6C6C6008484
      8400C6C6C60084848400E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      00006363630052525200000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C600000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600CECECE00DEDEDE009C9C9C00000000000000
      0000000000000000000000000000000000004A4A4A0094949400B5B5B5009494
      940094949400CECECE00E7E7E700C6C6C600C6C6C600E7E7E700CECECE009C9C
      9C009C9C9C00636363004A4A4A00000000000000000084848400E7E7E7008484
      8400E7E7E7008484840084848400848484008484840084848400848484000000
      00006363630052525200000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131000000000000000000000000000000
      000000000000C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      0000000000000000000000000000000000004A4A4A0094949400B5B5B5009C9C
      9C00CECECE00E7E7E700CECECE009C9C9C009C9C9C00CECECE00E7E7E700CECE
      CE009C9C9C00636363004A4A4A00000000000000000084848400C6C6C6008484
      8400E7E7E700E7E7E700E7E7E700E7E7E7008484840000000000000000000000
      000000000000636363005A5A5A000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600313131000000000000000000000000000000
      000000000000C6C6C600DEDEDE009C9C9C000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A009C9C9C009C9C
      9C00B5B5B5009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C006363630000000000000000000000000084848400E7E7E7008484
      8400848484008484840084848400848484008484840000000000000000000000
      00000000000000000000636363005252520042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C6003131310000000000000000000000000000000000000000000000
      000000000000C6C6C600B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A0094949400B5B5
      B5009C9C9C00B5B5B50094949400949494009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C004A4A4A0000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000636363000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      1800636363000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A009494
      94009C9C9C00B5B5B500B5B5B5009C9C9C00949494009C9C9C009C9C9C009C9C
      9C004A4A4A000000310000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A009494940094949400949494009494940073737300636363004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A0084848400525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5005A5A5A00848484006363630052525200B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      310000000000000000000000000000000000000000000000000063636300CECE
      CE00949494009494940094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C6005A5A5A008484840063636300C6C6C600636363005252
      5200000000000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      940000313100000000000000000000000000000000000000000063636300CECE
      CE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5B5009494
      9400B5B5B5009494940000000000000000005A5A5A0000000000000000000000
      00005A5A5A005A5A5A005A5A5A0000000000000000005A5A5A005A5A5A005A5A
      5A000000000000000000000000005A5A5A000000000084848400E7E7E7005252
      5200525252005252520063636300636363005252520052525200636363005252
      5200000000000000000000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000000000000063636300CECECE00B5B5
      B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5
      B500848484000000000094949400000000005A5A5A005A5A5A00000000000000
      0000000000005A5A5A00000000000000000000000000000000005A5A5A000000
      000000000000000000005A5A5A005A5A5A000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E7006363
      630052525200000000000000000000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE009494940000313100000000000000000063636300CECECE00CECE
      CE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C
      9C00B5B5B500000000009494940000000000000000005A5A5A005A5A5A000000
      0000000000005A5A5A00000000000000000000000000000000005A5A5A000000
      0000000000005A5A5A005A5A5A00000000000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300C6C6C6006363
      6300525252000000000000000000000000001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00949494000031310063636300CECECE00C6C6C600B5B5
      B500CECECE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5
      B50000000000B5B5B500949494000000000000000000000000005A5A5A005A5A
      5A00000000005A5A5A00000000000000000000000000000000005A5A5A000000
      00005A5A5A005A5A5A0000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B500636363005252520000000000000000001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      31000031310000313100003131000031310063636300CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE000000000094949400949494000000000000000000000000005A5A5A005A5A
      5A00000000005A5A5A00000000000000000000000000000000005A5A5A000000
      00005A5A5A005A5A5A0000000000000000000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B500636363005252520000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63009C9C9C00B5B5B5009494940000000000000000005A5A5A005A5A5A000000
      0000000000005A5A5A00000000000000000000000000000000005A5A5A000000
      0000000000005A5A5A005A5A5A00000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B50000000000636363005A5A5A00000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500B5B5B5009C9C
      9C00B5B5B5009C9C9C0094949400000000005A5A5A005A5A5A00000000000000
      0000000000005A5A5A00000000000000000000000000000000005A5A5A000000
      000000000000000000005A5A5A005A5A5A000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B500000000000000000063636300525252000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000063636300CECECE00C6C6
      C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500E7E7E700CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000005A5A5A0000000000000000000000
      00005A5A5A005A5A5A005A5A5A0000000000000000005A5A5A005A5A5A005A5A
      5A000000000000000000000000005A5A5A000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500CECECE00B5B5B5009C9C9C0063636300636363006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      000000000000000000000000000000000000000000000000000063636300CECE
      CE00CECECE00CECECE00CECECE009C9C9C006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000313100003131000031310000313100003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010009494940010101000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000A5A5A50094949400101010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00C6C6C600DEDEDE00003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000B5B5B500A5A5A500949494001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010101000C6C6C600B5B5B500A5A5A5009494
      9400101010000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000001010100010101000101010001010
      100010101000101010001010100010101000C6C6C600C6C6C600B5B5B500A5A5
      A500949494001010100000000000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000031310094949400949494009494
      940094949400949494009494940094949400C6C6C600C6C6C600C6C6C600B5B5
      B500A5A5A5009494940010101000000000000000000000000000000000000000
      0000000000001010100094949400CECECE00E7E7E700DEDEDE00003131000000
      0000000000000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C6007373730063636300000000000000000000313100CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6
      C600B5B5B500A5A5A50094949400101010001010100010101000101010001010
      1000101010001010100094949400CECECE00E7E7E700DEDEDE00003131000031
      3100003131000031310000313100003131004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6007373730063636300000000000000000000313100C6C6C600C6C6C600E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700C6C6C600B5B5B50094949400003131001010100094949400A5A5A500B5B5
      B500C6C6C600C6C6C600C6C6C600CECECE00E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0094949400003131004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C6000000000073737300636363000000000000313100DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700C6C6
      C600C6C6C600949494000031310000000000000000001010100094949400A5A5
      A500B5B5B500C6C6C600C6C6C600C6C6C600E7E7E700DEDEDE00F7F7F700DEDE
      DE00DEDEDE009494940000313100000000004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000073737300636363000031310000313100003131000031
      310000313100003131000031310000313100DEDEDE00F7F7F700DEDEDE00C6C6
      C600949494000031310000000000000000000000000000000000101010009494
      9400A5A5A500B5B5B500C6C6C600C6C6C600E7E7E700E7E7E700DEDEDE00DEDE
      DE00949494000031310000000000000000004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A0084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000737373000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00DEDEDE009494
      9400003131000000000000000000000000000000000000000000000000001010
      100094949400A5A5A500B5B5B500C6C6C600E7E7E700C6C6C600C6C6C6009494
      940000313100000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE00DEDEDE00949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      00001010100094949400A5A5A500B5B5B500C6C6C600C6C6C600949494000031
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000313100DEDEDE0094949400003131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100094949400A5A5A500B5B5B50094949400003131000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C0000000000000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010101000949494009494940000313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000003131000031310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010000031310000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5000000000000000000737373009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B5000000000073737300424242009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C00000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      0000636363004242420000000000000000009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      0000000000000000000073737300424242009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D6009C9C9C00D6D6D600D6D6D600D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600D6D6D6009C9C9C000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600292929003131310000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      63006363630063636300636363006363630042424200B5B5B500636363006363
      6300636363006363630063636300424242000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000007373730073737300737373007373
      73007373730073737300737373007373730042424200B5B5B500848484007373
      7300737373007373730073737300424242000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600292929003131310000000000000000005A5A
      5A00636363000000000000000000000000008484840084848400848484008484
      84008484840084848400848484008484840042424200B5B5B500848484009494
      9400848484008484840084848400424242000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B50042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00000000006363630084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000042424200424242004242420042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      63006363630063636300000000008484840084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0029292900313131004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300000000005A5A5A005A5A5A005A5A5A0042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B5008484840084848400000000009494940084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300A5A5A50063636300636363006363630042424200B5B5B500424242009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300CECECE00A5A5A500636363006363630042424200B5B5B500B5B5B5009494
      9400424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5006363630042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D6008484840084848400C6C6C600C6C6C6000000
      0000DEDEDE00000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE005252520042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      9400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600D6D6D600CECE
      CE00000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363006363630042424200B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000949494000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600CECECE00CECECE00CECECE00D6D6
      D600CECECE000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300737373007373730042424200B5B5B500848484009494
      9400424242000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000009494940000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00F7FFFF00F7FFFF0000000000000000000000000000000000000000006363
      63006363630073737300737373007373730073737300B5B5B500848484009494
      9400424242000000000000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400B5B5B5009494
      9400424242000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400B5B5
      B500424242000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      5200525252000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300E7E7E700A5A5A50063636300000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      73007373730073737300000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600848484008484840084848400848484008484840000000000C6C6
      C600DEDEDE00C6C6C600848484000000000000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      8400525252000000000000000000000000000000000000000000000000000000
      00000000000063636300E7E7E700A5A5A500E7E7E700A5A5A500636363000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      73007373730073737300000000000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000000000
      00000000000000848400A5A5A500E7E7E700CECECE00D6D6D600B5B5B5006363
      6300000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C6008484840000000000C6C6C600848484008484840000000000C6C6
      C600DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      000063636300B5B5B500E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7
      E700636363000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      73007373730073737300737373000000000084848400D6D6D600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      8400848484008484840063636300525252000000000000000000000000008484
      840063636300E7E7E700CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5
      A500C6C6C600636363000000000000000000000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A500848484008484840063636300525252000000000000000000000000008484
      840063636300CECECE00D6D6D600E7E7E700A5A5A500E7E7E700A5A5A500C6C6
      C600C6C6C600B5B5B5006363630000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C600C6C6
      C600848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000008484
      84008484840063636300B5B5B500A5A5A500E7E7E700A5A5A500C6C6C600C6C6
      C600B5B5B5000063630021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000000000000000000000A5A5
      A500A5A5A5008484840063636300E7E7E700B5B5B500C6C6C600C6C6C600A5A5
      A50063636300393939000000000000000000000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B5006363630052525200000000000000000000000000A5A5
      A500B5B5B500B5B5B5008484840063636300B5B5B500319C9C00636363006363
      63000000000000000000000000000000000000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A006363630052525200000000000000000094949400C6C6
      C600B5B5B500B5B5B50084848400848484006363630063636300000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00C6C6C60084848400000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000094949400B5B5B5008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C6008484840000000000000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0073737300525252000000000094949400A5A5A500848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400D6D6D600C6C6C6008484
      8400DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE0000000000848484000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      00007373730000000000000000000000000084848400DEDEDE00C6C6C6008484
      8400DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFF18FFFFF81FF807FC00F3FFE007
      F807F000F1FFC003E007C001F0FF8001E007C003F07F80018007C003F03F0000
      80078003F01F000080070001F00F000080078001F00F000080030000F01F0000
      80130000F03F000080390000F07F8001807C0001F0FF800180FE8003F1FFC003
      81FFC007F3FFE007FFFFE00FFFFFF81FFE7FFFFFFFFFFFBFFC3FFFFFFFFF8007
      F81FE000FFFF8007F00FC000FFFF8007E007C000718E8007C00380003BDC8007
      800180009BD9800700000000CBD3800300000000CBD38003F81F00009BD98001
      F81F80003BDC8004F81F8000718E8006F81F8000FFFF800FF81FC07FFFFF801F
      F81FE0FFFFFF803FF81FFFFFFFFFFFFF8001FFBFFE7FF81FFFFF001FFE3FF81F
      8001001FFE1FF81FFFFF0007FE0FF81F80010007FE07F81F75D600070003F81F
      000000070001F81F7416000300000000000100030000000055D9000100018001
      000000040003C00377760006FE07E00780010007FE0FF00FFFFF0007FE1FF81F
      8001C007FE3FFC3FFFFFC007FE7FFE7F87FFFFFFFFFFFFFF8003FFFFFFFF8001
      C0020000F00FFFFFC0000000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0010000FC3FFE7F800C0000F81FFFFF
      001F0000F00F80010FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000000E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00E003B9F700000600E00181F700000300E001FFF700000000E00388F70000
      0000E00F9CF700000000C03FC1F70000000087FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object pmnuCampos: TPopupMenu
    Left = 264
    Top = 110
  end
  object sdqCampos: TSDQuery
    DatabaseName = 'dbPrincipal'
    SQL.Strings = (
      'SELECT '
      
        '       ljt.jt_porcentajeresultadoprobable, ljt.jt_importereserva' +
        'honorarios,'
      
        '       ljt.jt_importereserva, lod.od_dentrodelregimen, lod.od_cu' +
        'mplenormashys,'
      '       lod.od_porcentajeincapacidadcalc, lrt.rt_montodemandado,'
      
        '       lrt.rt_porcentajeincapacidad, lrc.rc_reclamaincapacidad, ' +
        'lre.re_tipo'
      'FROM   legales.ljt_juicioentramite ljt,'
      '       legales.lrc_reclamo lrc,'
      '       legales.lre_reclamante lre,'
      '       legales.lrt_reclamojuicioentramite lrt,'
      '       legales.lod_origendemanda lod'
      'WHERE ((ljt.jt_id = lrt.rt_idjuicioentramite)'
      '  AND (lrc.rc_id = lrt.rt_idreclamo)'
      '  AND (ljt.jt_id = lod.od_idjuicioentramite)'
      '  AND (lre.re_id = lod.od_idreclamante)'
      '  AND (lrt.rt_idorigendemanda(+) = lod.od_id )'
      ')'
      '  '
      '  '
      ''
      ''
      ''
      '')
    Left = 172
    Top = 196
    object sdqCamposJT_PORCENTAJERESULTADOPROBABLE: TFloatField
      DisplayLabel = '% Resultado Probable'
      FieldName = 'JT_PORCENTAJERESULTADOPROBABLE'
    end
    object sdqCamposJT_IMPORTERESERVAHONORARIOS: TFloatField
      DisplayLabel = '$ Reserva Honorarios'
      FieldName = 'JT_IMPORTERESERVAHONORARIOS'
    end
    object sdqCamposJT_IMPORTERESERVA: TFloatField
      DisplayLabel = '$ Reserva Capital'
      FieldName = 'JT_IMPORTERESERVA'
    end
    object sdqCamposOD_DENTRODELREGIMEN: TStringField
      DisplayLabel = 'Est'#225' dentro del R'#233'gimen'
      FieldName = 'OD_DENTRODELREGIMEN'
      Size = 1
    end
    object sdqCamposOD_CUMPLENORMASHYS: TStringField
      DisplayLabel = 'Cumple Normas H&&S'
      FieldName = 'OD_CUMPLENORMASHYS'
      Size = 1
    end
    object sdqCamposOD_PORCENTAJEINCAPACIDADCALC: TFloatField
      Tag = 1
      DisplayLabel = '% Incapcacidad Calculada'
      FieldName = 'OD_PORCENTAJEINCAPACIDADCALC'
    end
    object sdqCamposRT_MONTODEMANDADO: TFloatField
      DisplayLabel = '$ Demandado'
      FieldName = 'RT_MONTODEMANDADO'
    end
    object sdqCamposRT_PORCENTAJEINCAPACIDAD: TFloatField
      Tag = 1
      DisplayLabel = '% Incapacidad Demandado'
      FieldName = 'RT_PORCENTAJEINCAPACIDAD'
    end
    object sdqCamposRC_RECLAMAINCAPACIDAD: TStringField
      Tag = 1
      DisplayLabel = 'Se Reclama Incapacidad'
      FieldName = 'RC_RECLAMAINCAPACIDAD'
      Required = True
      Size = 1
    end
    object sdqCamposRE_TIPO: TStringField
      DisplayLabel = 'Tipo de Reclamante'
      FieldName = 'RE_TIPO'
      Size = 2
    end
  end
  object mwSqlSynSql: TmwSqlSyn
    DefaultFilter = 'Query Files (*.sql,*.qry)|*.sql,*.qry'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGreen
    CommentAttri.Style = [fsItalic]
    CommentAttri.IntegerStyle = 2
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clWindowText
    IdentifierAttri.Style = []
    IdentifierAttri.IntegerStyle = 0
    SqlKeyAttri.Background = clWindow
    SqlKeyAttri.Foreground = clNavy
    SqlKeyAttri.Style = [fsBold]
    SqlKeyAttri.IntegerStyle = 1
    PlKeyAttri.Background = clWindow
    PlKeyAttri.Foreground = clWindowText
    PlKeyAttri.Style = [fsBold]
    PlKeyAttri.IntegerStyle = 1
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clWindowText
    NumberAttri.Style = []
    NumberAttri.IntegerStyle = 0
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    SpaceAttri.Style = []
    SpaceAttri.IntegerStyle = 0
    StringAttri.Background = clWindow
    StringAttri.Foreground = clTeal
    StringAttri.Style = []
    StringAttri.IntegerStyle = 0
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clRed
    SymbolAttri.Style = []
    SymbolAttri.IntegerStyle = 0
    ExceptionAttri.Background = clWindow
    ExceptionAttri.Foreground = clBlue
    ExceptionAttri.Style = [fsItalic]
    ExceptionAttri.IntegerStyle = 2
    DataTypeAttri.Background = clWindow
    DataTypeAttri.Foreground = clPurple
    DataTypeAttri.Style = []
    DataTypeAttri.IntegerStyle = 0
    FunctionAttri.Background = clWindow
    FunctionAttri.Foreground = clBlue
    FunctionAttri.Style = [fsBold]
    FunctionAttri.IntegerStyle = 1
    Left = 173
    Top = 260
  end
  object mwSqlSynSql2: TmwSqlSyn
    DefaultFilter = 'Query Files (*.sql,*.qry)|*.sql,*.qry'
    CommentAttri.Background = clWindow
    CommentAttri.Foreground = clGreen
    CommentAttri.Style = [fsItalic]
    CommentAttri.IntegerStyle = 2
    IdentifierAttri.Background = clWindow
    IdentifierAttri.Foreground = clWindowText
    IdentifierAttri.Style = []
    IdentifierAttri.IntegerStyle = 0
    SqlKeyAttri.Background = clWindow
    SqlKeyAttri.Foreground = clNavy
    SqlKeyAttri.Style = [fsBold]
    SqlKeyAttri.IntegerStyle = 1
    PlKeyAttri.Background = clWindow
    PlKeyAttri.Foreground = clWindowText
    PlKeyAttri.Style = [fsBold]
    PlKeyAttri.IntegerStyle = 1
    NumberAttri.Background = clWindow
    NumberAttri.Foreground = clWindowText
    NumberAttri.Style = []
    NumberAttri.IntegerStyle = 0
    SpaceAttri.Background = clWindow
    SpaceAttri.Foreground = clWindowText
    SpaceAttri.Style = []
    SpaceAttri.IntegerStyle = 0
    StringAttri.Background = clWindow
    StringAttri.Foreground = clTeal
    StringAttri.Style = []
    StringAttri.IntegerStyle = 0
    SymbolAttri.Background = clWindow
    SymbolAttri.Foreground = clRed
    SymbolAttri.Style = []
    SymbolAttri.IntegerStyle = 0
    ExceptionAttri.Background = clWindow
    ExceptionAttri.Foreground = clBlue
    ExceptionAttri.Style = [fsItalic]
    ExceptionAttri.IntegerStyle = 2
    DataTypeAttri.Background = clWindow
    DataTypeAttri.Foreground = clPurple
    DataTypeAttri.Style = []
    DataTypeAttri.IntegerStyle = 0
    FunctionAttri.Background = clWindow
    FunctionAttri.Foreground = clBlue
    FunctionAttri.Style = [fsBold]
    FunctionAttri.IntegerStyle = 1
    Left = 332
    Top = 247
  end
end
