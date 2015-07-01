inherited frmManEquipos: TfrmManEquipos
  Left = 213
  Top = 180
  Caption = 'Mantenimiento de Equipos'
  ClientHeight = 493
  ClientWidth = 1042
  Constraints.MinHeight = 520
  Constraints.MinWidth = 1050
  Font.Name = 'Tahoma'
  ExplicitWidth = 1050
  ExplicitHeight = 520
  PixelsPerInch = 96
  TextHeight = 13
  object JvOutlookSplitterr: TJvOutlookSplitter [0]
    Left = 0
    Top = 138
    Width = 1042
    Height = 6
    Align = alTop
    AutoSnap = True
    Color = 16774371
    ParentColor = False
    ColorFrom = 16765615
    ColorTo = 15587784
    ExplicitWidth = 972
  end
  inherited pnlFiltros: TPanel
    Width = 1042
    Height = 138
    AutoSize = True
    Visible = True
    ExplicitWidth = 1042
    ExplicitHeight = 138
    object pcFiltros: TPageControl
      Left = 0
      Top = 0
      Width = 1043
      Height = 138
      ActivePage = tsPrincipal
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tsPrincipal: TTabSheet
        Caption = 'Filtros'
        DesignSize = (
          1035
          110)
        object Label5: TLabel
          Left = 12
          Top = 4
          Width = 54
          Height = 13
          Caption = 'Descripci'#243'n'
        end
        object Label6: TLabel
          Left = 176
          Top = 4
          Width = 36
          Height = 13
          Caption = 'Usuario'
        end
        object Label7: TLabel
          Left = 376
          Top = 4
          Width = 70
          Height = 13
          Caption = 'Tipo de equipo'
        end
        object Label19: TLabel
          Left = 508
          Top = 4
          Width = 40
          Height = 13
          Caption = 'Memoria'
        end
        object Label20: TLabel
          Left = 552
          Top = 24
          Width = 12
          Height = 13
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 12
          Top = 44
          Width = 51
          Height = 13
          Caption = 'Resoluci'#243'n'
        end
        object Label22: TLabel
          Left = 136
          Top = 44
          Width = 17
          Height = 13
          Caption = 'Bits'
        end
        object Label23: TLabel
          Left = 192
          Top = 44
          Width = 12
          Height = 13
          Caption = 'Hz'
        end
        object Label24: TLabel
          Left = 248
          Top = 44
          Width = 86
          Height = 13
          Caption = 'Sistema operativo'
        end
        object Label25: TLabel
          Left = 488
          Top = 44
          Width = 35
          Height = 13
          Caption = 'Versi'#243'n'
        end
        object Label27: TLabel
          Left = 95
          Top = 3
          Width = 55
          Height = 13
          Caption = 'Comentario'
        end
        object Label28: TLabel
          Left = 897
          Top = 25
          Width = 12
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 803
          Top = 3
          Width = 90
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #218'ltima modificaci'#243'n'
        end
        object edEQ_DESCRIPCION: TEdit
          Left = 8
          Top = 20
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        inline fraSE_USUARIO: TfraUsuario
          Left = 176
          Top = 20
          Width = 194
          Height = 21
          TabOrder = 1
          ExplicitLeft = 176
          ExplicitTop = 20
          ExplicitWidth = 194
          inherited cmbDescripcion: TArtComboBox
            Width = 110
            ExplicitWidth = 110
          end
        end
        object cmbTIPO: TComboBox
          Left = 372
          Top = 20
          Width = 129
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          Items.Strings = (
            'Servidores'
            'Estaciones de trabajo')
        end
        object edEQ_MEMORIADesde: TIntEdit
          Left = 504
          Top = 20
          Width = 45
          Height = 21
          TabOrder = 3
        end
        object edEQ_MEMORIAHasta: TIntEdit
          Left = 568
          Top = 20
          Width = 45
          Height = 21
          TabOrder = 4
        end
        object chkBajas: TJvXPCheckbox
          Left = 803
          Top = 46
          Width = 111
          Height = 29
          Caption = 'No ver dadas de baja'
          TabOrder = 5
          Checked = True
          State = cbChecked
          Anchors = [akTop, akRight]
        end
        object chkProblemaDeDisco: TJvXPCheckbox
          Left = 803
          Top = 78
          Width = 111
          Height = 29
          Caption = 'Ver solo problemas de disco'
          TabOrder = 6
          Anchors = [akTop, akRight]
        end
        object cmbRESOLUCION: TComboBox
          Left = 8
          Top = 60
          Width = 121
          Height = 21
          Style = csDropDownList
          TabOrder = 7
        end
        object cmbBITS: TComboBox
          Left = 132
          Top = 60
          Width = 53
          Height = 21
          Style = csDropDownList
          TabOrder = 8
        end
        object cmbHZ: TComboBox
          Left = 188
          Top = 60
          Width = 53
          Height = 21
          Style = csDropDownList
          TabOrder = 9
        end
        object cmbNUM_SYSOP: TComboBox
          Left = 244
          Top = 60
          Width = 238
          Height = 21
          Style = csDropDownList
          TabOrder = 10
        end
        object cmbVERSION: TComboBox
          Left = 484
          Top = 60
          Width = 129
          Height = 21
          Style = csDropDownList
          TabOrder = 11
        end
        object rgEquiposPorUsuario: TAdvOfficeRadioGroup
          Left = 621
          Top = 13
          Width = 176
          Height = 68
          Version = '1.3.2.0'
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Ver '
          ParentBackground = False
          TabOrder = 12
          ItemIndex = 0
          Items.Strings = (
            'Todo'
            'Equipos sin usuario asignado'
            'Equipos con usuario asignado')
          Ellipsis = False
        end
        object edEQ_COMMENT_FULL_LIKE: TEdit
          Left = 92
          Top = 20
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 13
        end
        object edEQ_FECHAMODIFHasta: TDateComboBox
          Left = 914
          Top = 20
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 14
        end
        object edEQ_FECHAMODIFDesde: TDateComboBox
          Left = 803
          Top = 20
          Width = 88
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 15
        end
      end
      object tsSoftware: TTabSheet
        Caption = 'Software instalado'
        ImageIndex = 1
        object clbProgramas: TARTCheckListBox
          Left = 144
          Top = 0
          Width = 891
          Height = 110
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelEdges = []
          BevelKind = bkSoft
          Columns = 4
          ItemHeight = 13
          TabOrder = 0
          AutoAjustarColumnas = False
          Locked = False
          SQL = 
            'SELECT TRIM(er_descripcion), er_id FROM computos.cer_programas W' +
            'HERE EXISTS(SELECT 1 FROM computos.cep_equipo_programa WHERE ep_' +
            'idprograma = er_id) AND UPPER(er_descripcion) NOT LIKE '#39'%WINDOWS' +
            ' XP%'#39' AND UPPER(er_descripcion) NOT LIKE '#39'%ACTUALIZA%'#39' AND UPPER' +
            '(er_descripcion) NOT LIKE '#39'%UPDATE%'#39' ORDER BY er_descripcion'
        end
        object rbTodos: TRadioButton
          Left = 4
          Top = 0
          Width = 133
          Height = 34
          Caption = 'S'#243'lo los que tengan todos los programas'
          Checked = True
          TabOrder = 1
          TabStop = True
          WordWrap = True
        end
        object rbAlMenosUno: TRadioButton
          Left = 4
          Top = 36
          Width = 133
          Height = 34
          Caption = 'Aquellos que tengan al menos un programa de los seleccionados'
          TabOrder = 2
          WordWrap = True
        end
        object rbNoInstalado: TRadioButton
          Left = 4
          Top = 76
          Width = 133
          Height = 34
          Caption = 'Quien no tenga instalado los programas'
          TabOrder = 3
          WordWrap = True
        end
      end
      object tsSesionOracle: TTabSheet
        Caption = 'Par'#225'metro de Sesi'#243'n (ORACLE)'
        ImageIndex = 2
        OnResize = tsSesionOracleResize
        object pnlParameter: TPanel
          Left = 0
          Top = 0
          Width = 473
          Height = 110
          Align = alLeft
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object rbTodosParam: TRadioButton
            Left = 4
            Top = 4
            Width = 129
            Height = 34
            Caption = 'S'#243'lo los que tengan todos los par'#225'metros'
            Checked = True
            TabOrder = 0
            TabStop = True
            WordWrap = True
          end
          object rbAlMenosUnParam: TRadioButton
            Left = 4
            Top = 38
            Width = 129
            Height = 34
            Caption = 'Aquellos que tengan al menos un par'#225'metro'
            TabOrder = 1
            WordWrap = True
          end
          object rbTodosMenosParam: TRadioButton
            Left = 4
            Top = 72
            Width = 129
            Height = 34
            Caption = 'Quien no tenga definido el par'#225'metro'
            TabOrder = 2
            WordWrap = True
          end
          object clbParametros: TARTCheckListBox
            Left = 134
            Top = 2
            Width = 337
            Height = 106
            Align = alRight
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelEdges = []
            Columns = 3
            ItemHeight = 13
            TabOrder = 3
            AutoAjustarColumnas = False
            Locked = False
            SQL = 
              'SELECT DISTINCT pa_parametro, pa_parametro FROM computos.cpa_par' +
              'ametrosesion WHERE 1 = 1 ORDER BY 1'
          end
        end
        object Panel1: TPanel
          Left = 473
          Top = 0
          Width = 562
          Height = 110
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            562
            110)
          object Label26: TLabel
            Left = 295
            Top = 6
            Width = 261
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Valores de los par'#225'metros de Sesi'#243'n de Oracle'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitLeft = 225
          end
          object clbValores: TARTCheckListBox
            Left = 137
            Top = 24
            Width = 423
            Height = 84
            Anchors = [akLeft, akTop, akRight]
            BevelEdges = []
            Columns = 2
            ItemHeight = 13
            TabOrder = 0
            AutoAjustarColumnas = False
            Locked = False
            SQL = 
              'SELECT DISTINCT pa_parametro || '#39'('#39' || pa_valor || '#39')'#39', pa_valor' +
              ' FROM computos.cpa_parametrosesion WHERE 1 = 1 ORDER BY 1'
          end
          object rbTodoValor: TRadioButton
            Left = 8
            Top = 8
            Width = 129
            Height = 34
            Caption = 'S'#243'lo los que tengan todos los valores'
            Checked = True
            TabOrder = 1
            TabStop = True
            WordWrap = True
          end
          object rbAlMenosUnValor: TRadioButton
            Left = 4
            Top = 40
            Width = 129
            Height = 34
            Caption = 'Aquellos que tengan al menos un valor'
            TabOrder = 2
            WordWrap = True
          end
          object rbNingunValor: TRadioButton
            Left = 4
            Top = 74
            Width = 129
            Height = 34
            Caption = 'Quien no tenga definido el valor'
            TabOrder = 3
            WordWrap = True
          end
        end
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 144
    Width = 1042
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1036
      end>
    ExplicitTop = 144
    ExplicitWidth = 1042
    inherited ToolBar: TToolBar
      Left = 9
      Width = 1029
      ExplicitLeft = 9
      ExplicitWidth = 1029
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 173
    Width = 1042
    Height = 302
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    AutoTitleHeight = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EQ_ID'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_DESCRIPCION'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_IP'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_ENCENDIDO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_SERVIDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_COMMENT'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_OBSERVACIONES'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SE_NOMBRE'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_CPU'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_MEMORIA'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_LASTLOGON'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_SYSOP'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_SYSOP_VER'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_SCREEN_WIDTH'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_SCREEN_HEIGHT'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_SCREEN_HZ'
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_SCREEN_BITSPERPIXEL'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROBLEMA_DE_DISCO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Wingdings'
        Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_PROGRAMAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Caption = 'Software'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EQ_FECHAMODIF'
        Title.Caption = #218'ltima modificaci'#243'n'
        Width = 89
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 144
    Top = 236
    Width = 429
    Height = 409
    OnShow = fpAbmShow
    Constraints.MaxWidth = 429
    Constraints.MinWidth = 429
    ExplicitLeft = 144
    ExplicitTop = 236
    ExplicitWidth = 429
    ExplicitHeight = 409
    DesignSize = (
      429
      409)
    inherited BevelAbm: TBevel
      Top = 373
      Width = 421
      ExplicitTop = 373
      ExplicitWidth = 421
    end
    inherited btnAceptar: TButton
      Left = 274
      Top = 379
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 274
      ExplicitTop = 379
    end
    inherited btnCancelar: TButton
      Left = 349
      Top = 379
      ExplicitLeft = 349
      ExplicitTop = 379
    end
    object pcPaginas: TPageControl
      Left = 0
      Top = 0
      Width = 429
      Height = 368
      ActivePage = tsGeneral
      Align = alTop
      TabOrder = 2
      object tsGeneral: TTabSheet
        Caption = 'General'
        DesignSize = (
          421
          340)
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 10
          Height = 13
          Caption = 'Id'
        end
        object Label2: TLabel
          Left = 80
          Top = 4
          Width = 54
          Height = 13
          Caption = 'Descripci'#243'n'
        end
        object Label3: TLabel
          Left = 332
          Top = 4
          Width = 10
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'IP'
        end
        object Label4: TLabel
          Left = 8
          Top = 48
          Width = 71
          Height = 13
          Caption = 'Observaciones'
        end
        object Label8: TLabel
          Left = 8
          Top = 116
          Width = 55
          Height = 13
          Caption = 'Comentario'
        end
        object Label9: TLabel
          Left = 204
          Top = 116
          Width = 114
          Height = 13
          Caption = #218'ltimo usuario logueado'
        end
        object Label10: TLabel
          Left = 8
          Top = 156
          Width = 40
          Height = 13
          Caption = 'Memoria'
        end
        object Label11: TLabel
          Left = 80
          Top = 156
          Width = 20
          Height = 13
          Caption = 'CPU'
        end
        object Label12: TLabel
          Left = 8
          Top = 196
          Width = 88
          Height = 13
          Caption = 'Sistema Operativo'
        end
        object Label13: TLabel
          Left = 164
          Top = 196
          Width = 35
          Height = 13
          Caption = 'Versi'#243'n'
        end
        object Label14: TLabel
          Left = 316
          Top = 196
          Width = 22
          Height = 13
          Caption = 'Build'
        end
        object Label15: TLabel
          Left = 8
          Top = 236
          Width = 51
          Height = 13
          Caption = 'Resoluci'#243'n'
        end
        object Label16: TLabel
          Left = 192
          Top = 256
          Width = 11
          Height = 13
          Caption = 'hz'
        end
        object Label17: TLabel
          Left = 72
          Top = 256
          Width = 6
          Height = 13
          Caption = 'x'
        end
        object Label18: TLabel
          Left = 256
          Top = 256
          Width = 17
          Height = 13
          Caption = 'bits'
        end
        object edEQ_DESCRIPCION2: TEdit
          Left = 76
          Top = 20
          Width = 244
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 0
        end
        object mskEQ_IP: TMaskEdit
          Left = 328
          Top = 20
          Width = 89
          Height = 21
          Anchors = [akTop, akRight]
          EditMask = '###.###.###.###;1; '
          MaxLength = 15
          TabOrder = 1
          Text = '   .   .   .   '
        end
        object chkEQ_ENCENDIDO: TCheckBox
          Left = 328
          Top = 68
          Width = 74
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Encendido'
          TabOrder = 2
        end
        object chkEQ_SERVIDOR: TCheckBox
          Left = 328
          Top = 88
          Width = 74
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Servidor'
          TabOrder = 3
        end
        object edEQ_OBSERVACIONES: TMemo
          Left = 4
          Top = 64
          Width = 317
          Height = 45
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 255
          TabOrder = 4
        end
        object edEQ_ID: TIntEdit
          Left = 4
          Top = 20
          Width = 69
          Height = 21
          TabOrder = 5
          MaxLength = 0
        end
        object edEQ_COMMENT: TEdit
          Left = 4
          Top = 132
          Width = 193
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 6
        end
        object edEQ_LASTLOGON: TEdit
          Left = 200
          Top = 132
          Width = 217
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 7
        end
        object edEQ_MEMORIA: TIntEdit
          Left = 4
          Top = 172
          Width = 69
          Height = 21
          TabOrder = 8
          MaxLength = 0
        end
        object edEQ_CPU: TEdit
          Left = 76
          Top = 172
          Width = 341
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 9
        end
        object edEQ_SYSOP: TEdit
          Left = 4
          Top = 212
          Width = 153
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 10
        end
        object edEQ_SYSOP_VER: TEdit
          Left = 160
          Top = 212
          Width = 149
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 11
        end
        object edEQ_SYSOP_BUILD: TEdit
          Left = 312
          Top = 212
          Width = 105
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          MaxLength = 250
          TabOrder = 12
        end
        object edEQ_SCREEN_WIDTH: TIntEdit
          Left = 4
          Top = 252
          Width = 65
          Height = 21
          TabOrder = 13
          MaxLength = 0
        end
        object edEQ_SCREEN_HEIGHT: TIntEdit
          Left = 80
          Top = 252
          Width = 65
          Height = 21
          TabOrder = 14
          MaxLength = 0
        end
        object edEQ_SCREEN_HZ: TIntEdit
          Left = 148
          Top = 252
          Width = 41
          Height = 21
          TabOrder = 15
          MaxLength = 0
        end
        object edEQ_SCREEN_BITSPERPIXEL: TIntEdit
          Left = 212
          Top = 252
          Width = 41
          Height = 21
          TabOrder = 16
          MaxLength = 0
        end
        object dbgDiscos: TRxDBGrid
          Left = 4
          Top = 280
          Width = 413
          Height = 56
          Anchors = [akLeft, akTop, akBottom]
          DataSource = dsDiscos
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 17
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          RowColor2 = 16776176
          OnGetCellProps = dbgDiscosGetCellProps
          Columns = <
            item
              Expanded = False
              FieldName = 'ED_UNIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ED_ETIQUETA'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ED_ESPACIOTOTAL'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ED_ESPACIOOCUPADO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ED_ESPACIOLIBRE'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORC_LIBRE'
              Width = 40
              Visible = True
            end>
        end
      end
      object tsSoftwareInstalado: TTabSheet
        Caption = 'Software instalado'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object dbgSoftwareInstalado: TArtDBGrid
          Left = 0
          Top = 0
          Width = 421
          Height = 340
          Align = alClient
          DataSource = dsSoftwareInstalado
          Options = [dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'ER_DESCRIPCION'
              Title.Caption = 'Descripci'#243'n del Software'
              Width = 359
              Visible = True
            end>
        end
      end
      object tsParametros: TTabSheet
        Caption = 'Par'#225'metros ORACLE'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object dbgParametrosOracle: TArtDBGrid
          Left = 0
          Top = 0
          Width = 421
          Height = 340
          Align = alClient
          DataSource = dsParametrosOracle
          Options = [dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          FooterBand = False
          TitleHeight = 17
          AutoTitleHeight = True
          Columns = <
            item
              Expanded = False
              FieldName = 'PA_PARAMETRO'
              Title.Caption = 'Par'#225'metro'
              Width = 359
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PA_VALOR'
              Title.Caption = 'Valor'
              Visible = True
            end>
        end
      end
    end
  end
  object pnlBottom: TPanel [5]
    Left = 0
    Top = 475
    Width = 1042
    Height = 18
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT /*+ use_nl(usuarios equipos)*/'
      
        '               DISTINCT equipos.eq_id, UPPER(equipos.eq_descripc' +
        'ion) as eq_descripcion,'
      
        '                        equipos.eq_ip, equipos.eq_encendido, equ' +
        'ipos.eq_servidor, equipos.eq_observaciones, se_nombre, se_usuari' +
        'o,'
      '                        case equipos.eq_servidor'
      '                          when '#39'S'#39' then 0'
      '                          when '#39'N'#39' then 1'
      '                        end as tipo,'
      
        '                        equipos.eq_comment, equipos.eq_lastlogon' +
        ','
      
        '                        equipos.eq_memoria, equipos.eq_cpu, equi' +
        'pos.eq_sysop, equipos.eq_sysop_ver,'
      
        '                        equipos.eq_sysop_servicepack, equipos.eq' +
        '_sysop_build, equipos.eq_screen_width,'
      
        '                        equipos.eq_screen_height, equipos.eq_scr' +
        'een_bitsperpixel, equipos.eq_screen_hz,'
      
        '                        equipos.eq_usualta, equipos.eq_fechaalta' +
        ', equipos.eq_usumodif, equipos.eq_fechamodif,'
      
        '                        equipos.eq_usubaja, equipos.eq_fechabaja' +
        ','
      
        '                        equipos_subdetalle.num_sysop as num_syso' +
        'p,'
      
        '                        equipos_subdetalle2.num_sysop_ver as ver' +
        'sion,'
      
        '                        equipos_subdetalle_res.num_screen_resolu' +
        'tion as resolucion,'
      
        '                        equipos_subdetalle_hz.num_screen_hz as h' +
        'z,'
      
        '                        equipos_subdetalle_bits.num_screen_bits ' +
        'as bits,                                                 '
      '                       (SELECT case'
      
        '                                 when MIN(ROUND ((ed_espaciolibr' +
        'e_mb / ed_espaciototal_mb) * 100)) < 5 then '#39#252#39
      '                                 else '#39#251#39
      '                               end'
      '                          FROM computos.ced_equipo_disco'
      
        '                         WHERE ed_id = equipos.eq_id) as problem' +
        'a_de_disco,'
      '                         TO_NUMBER(NULL) as PROGRAMAS,'
      ''
      '                       (SELECT CASE'
      '                                 WHEN EXISTS(SELECT 1'
      
        '                                               FROM computos.cep' +
        '_equipo_programa'
      
        '                                              WHERE ep_id = equi' +
        'pos.eq_id) THEN '#39#252#39
      '                                 ELSE '#39#251#39
      '                               END'
      '                          FROM DUAL) AS cant_programas'
      '                       /*'
      '                       (SELECT COUNT(*)'
      
        '                          FROM computos.cep_equipo_programa, com' +
        'putos.cer_programas'
      '                         WHERE ep_id = equipos.eq_id'
      '                           AND er_id = ep_idprograma'
      
        '                           AND er_omitir = '#39'N'#39') as CANT_PROGRAMA' +
        'S'
      '                       */    '
      '                   FROM computos.ceq_equipo equipos    '
      
        '              LEFT JOIN art.use_usuarios usuarios ON equipos.eq_' +
        'id = se_pc AND se_fechabaja IS NULL'
      
        '              LEFT JOIN (SELECT rownum - 1 as num_sysop, descrip' +
        'cion '
      
        '                           FROM (SELECT DISTINCT eq_sysop descri' +
        'pcion'
      
        '                                   FROM computos.ceq_equipo equi' +
        'pos_detalle'
      '                               ORDER BY 1)'
      
        '                        ) equipos_subdetalle ON equipos.eq_sysop' +
        ' = equipos_subdetalle.descripcion'
      
        '              LEFT JOIN (SELECT rownum - 1 as num_screen_hz, des' +
        'cripcion'
      
        '                           FROM (SELECT DISTINCT eq_screen_hz de' +
        'scripcion'
      
        '                                   FROM computos.ceq_equipo equi' +
        'pos_detalle'
      '                               ORDER BY 1)'
      
        '                        ) equipos_subdetalle_hz ON equipos.eq_sc' +
        'reen_hz = equipos_subdetalle_hz.descripcion'
      
        '              LEFT JOIN (SELECT rownum - 1 as num_screen_bits, d' +
        'escripcion'
      
        '                           FROM (SELECT DISTINCT eq_screen_bitsp' +
        'erpixel descripcion'
      
        '                                   FROM computos.ceq_equipo equi' +
        'pos_detalle'
      '                               ORDER BY 1)'
      
        '                        ) equipos_subdetalle_bits ON equipos.eq_' +
        'screen_bitsperpixel = equipos_subdetalle_bits.descripcion'
      
        '              LEFT JOIN (SELECT rownum - 1 as num_screen_resolut' +
        'ion, descripcion'
      
        '                           FROM (SELECT DISTINCT eq_screen_width' +
        ' || '#39' x '#39' || eq_screen_height descripcion'
      
        '                                   FROM computos.ceq_equipo equi' +
        'pos_detalle'
      '                               ORDER BY 1)'
      
        '                        ) equipos_subdetalle_res ON equipos.eq_s' +
        'creen_width || '#39' x '#39' || equipos.eq_screen_height = equipos_subde' +
        'talle_res.descripcion'
      
        '              LEFT JOIN (SELECT rownum - 1 as num_sysop_ver, des' +
        'cripcion'
      
        '                           FROM (SELECT DISTINCT eq_sysop_ver de' +
        'scripcion'
      
        '                                   FROM computos.ceq_equipo equi' +
        'pos_detalle'
      '                               ORDER BY 1)'
      
        '                        ) equipos_subdetalle2 ON equipos.eq_syso' +
        'p_ver = equipos_subdetalle2.descripcion)'
      ' WHERE 1=1')
    object sdqConsultaEQ_ID: TFloatField
      DisplayLabel = 'Id'
      FieldName = 'EQ_ID'
      Required = True
    end
    object sdqConsultaEQ_DESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'EQ_DESCRIPCION'
      Required = True
      Size = 50
    end
    object sdqConsultaEQ_IP: TStringField
      DisplayLabel = 'IP'
      FieldName = 'EQ_IP'
      Size = 15
    end
    object sdqConsultaEQ_ENCENDIDO: TStringField
      DisplayLabel = 'Encendido'
      FieldName = 'EQ_ENCENDIDO'
      Required = True
      Size = 1
    end
    object sdqConsultaEQ_SERVIDOR: TStringField
      DisplayLabel = 'Servidor'
      FieldName = 'EQ_SERVIDOR'
      Required = True
      Size = 1
    end
    object sdqConsultaEQ_OBSERVACIONES: TStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'EQ_OBSERVACIONES'
      Size = 255
    end
    object sdqConsultaSE_NOMBRE: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'SE_NOMBRE'
      Size = 50
    end
    object sdqConsultaTIPO: TFloatField
      FieldName = 'TIPO'
    end
    object sdqConsultaEQ_COMMENT: TStringField
      DisplayLabel = 'Comentario'
      FieldName = 'EQ_COMMENT'
      Size = 255
    end
    object sdqConsultaEQ_LASTLOGON: TStringField
      DisplayLabel = #218'ltimo logueo'
      FieldName = 'EQ_LASTLOGON'
      Size = 255
    end
    object sdqConsultaEQ_MEMORIA: TFloatField
      DisplayLabel = 'Memoria'
      FieldName = 'EQ_MEMORIA'
    end
    object sdqConsultaEQ_CPU: TStringField
      DisplayLabel = 'Procesador'
      FieldName = 'EQ_CPU'
      Size = 255
    end
    object sdqConsultaEQ_SYSOP: TStringField
      DisplayLabel = 'Sistema operativo'
      FieldName = 'EQ_SYSOP'
      Size = 255
    end
    object sdqConsultaEQ_SYSOP_VER: TStringField
      DisplayLabel = 'Versi'#243'n'
      FieldName = 'EQ_SYSOP_VER'
      Size = 255
    end
    object sdqConsultaEQ_SYSOP_SERVICEPACK: TStringField
      FieldName = 'EQ_SYSOP_SERVICEPACK'
      Size = 255
    end
    object sdqConsultaEQ_SYSOP_BUILD: TStringField
      FieldName = 'EQ_SYSOP_BUILD'
      Size = 255
    end
    object sdqConsultaEQ_SCREEN_WIDTH: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'EQ_SCREEN_WIDTH'
    end
    object sdqConsultaEQ_SCREEN_HEIGHT: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'EQ_SCREEN_HEIGHT'
    end
    object sdqConsultaEQ_SCREEN_BITSPERPIXEL: TStringField
      DisplayLabel = 'Bits'
      FieldName = 'EQ_SCREEN_BITSPERPIXEL'
      Size = 4
    end
    object sdqConsultaEQ_SCREEN_HZ: TFloatField
      DisplayLabel = 'Hz'
      FieldName = 'EQ_SCREEN_HZ'
    end
    object sdqConsultaEQ_USUALTA: TStringField
      FieldName = 'EQ_USUALTA'
    end
    object sdqConsultaEQ_FECHAALTA: TDateTimeField
      FieldName = 'EQ_FECHAALTA'
    end
    object sdqConsultaEQ_USUMODIF: TStringField
      FieldName = 'EQ_USUMODIF'
    end
    object sdqConsultaEQ_FECHAMODIF: TDateTimeField
      FieldName = 'EQ_FECHAMODIF'
    end
    object sdqConsultaEQ_USUBAJA: TStringField
      FieldName = 'EQ_USUBAJA'
    end
    object sdqConsultaEQ_FECHABAJA: TDateTimeField
      FieldName = 'EQ_FECHABAJA'
    end
    object sdqConsultaSE_USUARIO: TStringField
      FieldName = 'SE_USUARIO'
    end
    object sdqConsultaPROBLEMA_DE_DISCO: TStringField
      DisplayLabel = 'Problemas de espacio en disco'
      FieldName = 'PROBLEMA_DE_DISCO'
      Size = 1
    end
    object sdqConsultaNUM_SYSOP: TFloatField
      FieldName = 'NUM_SYSOP'
    end
    object sdqConsultaVERSION: TFloatField
      FieldName = 'VERSION'
    end
    object sdqConsultaRESOLUCION: TFloatField
      FieldName = 'RESOLUCION'
    end
    object sdqConsultaHZ: TFloatField
      FieldName = 'HZ'
    end
    object sdqConsultaBITS: TFloatField
      FieldName = 'BITS'
    end
    object sdqConsultaPROGRAMAS: TFloatField
      FieldName = 'PROGRAMAS'
    end
    object sdqConsultaCANT_PROGRAMAS: TStringField
      FieldName = 'CANT_PROGRAMAS'
      Size = 1
    end
  end
  inherited FieldHider: TFieldHider
    DBGrid = nil
  end
  object ShortCutControlHijo: TShortCutControl
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
    Left = 80
    Top = 200
  end
  object sdqDiscos: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqDiscosAfterOpen
    SQL.Strings = (
      
        'SELECT ed_unidad, ed_etiqueta, ed_espaciototal, ed_espacioocupad' +
        'o,'
      '       ed_espaciolibre, ed_espaciolibre_mb, ed_espaciototal_mb,'
      
        '       ROUND ((ed_espaciolibre_mb / ed_espaciototal_mb) * 100) A' +
        'S porc_libre'
      '  FROM computos.ced_equipo_disco'
      ' WHERE ed_id = :ID')
    Left = 24
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    object sdqDiscosED_UNIDAD: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ED_UNIDAD'
      Required = True
      Size = 1
    end
    object sdqDiscosED_ETIQUETA: TStringField
      DisplayLabel = 'Etiqueta'
      FieldName = 'ED_ETIQUETA'
      Size = 255
    end
    object sdqDiscosED_ESPACIOTOTAL: TStringField
      DisplayLabel = 'Total'
      FieldName = 'ED_ESPACIOTOTAL'
    end
    object sdqDiscosED_ESPACIOOCUPADO: TStringField
      DisplayLabel = 'Ocupado'
      FieldName = 'ED_ESPACIOOCUPADO'
    end
    object sdqDiscosED_ESPACIOLIBRE: TStringField
      DisplayLabel = 'Disponible'
      FieldName = 'ED_ESPACIOLIBRE'
    end
    object sdqDiscosED_ESPACIOLIBRE_MB: TFloatField
      FieldName = 'ED_ESPACIOLIBRE_MB'
    end
    object sdqDiscosED_ESPACIOTOTAL_MB: TFloatField
      FieldName = 'ED_ESPACIOTOTAL_MB'
    end
    object sdqDiscosPORC_LIBRE: TFloatField
      DisplayLabel = 'Libre'
      FieldName = 'PORC_LIBRE'
      DisplayFormat = '## %'
    end
  end
  object dsDiscos: TDataSource
    DataSet = sdqDiscos
    Left = 52
    Top = 312
  end
  object sdqSoftwareInstalado: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqSoftwareInstaladoAfterOpen
    SQL.Strings = (
      '  SELECT er_descripcion'
      '    FROM computos.cep_equipo_programa, computos.cer_programas'
      '   WHERE ep_id = :ID'
      '     AND er_id = ep_idprograma'
      '     AND UPPER(er_descripcion) NOT LIKE '#39'%WINDOWS XP%'#39
      '     AND UPPER(er_descripcion) NOT LIKE '#39'%ACTUALIZA%'#39
      '     AND UPPER(er_descripcion) NOT LIKE '#39'%UPDATE%'#39
      'ORDER BY 1')
    Left = 24
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsSoftwareInstalado: TDataSource
    DataSet = sdqSoftwareInstalado
    Left = 52
    Top = 340
  end
  object sdqParametrosOracle: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    AfterOpen = sdqParametrosOracleAfterOpen
    SQL.Strings = (
      '  SELECT pa_parametro, pa_valor'
      '    FROM computos.cpa_parametrosesion'
      '   WHERE pa_idequipo = :ID'
      'ORDER BY 1')
    Left = 24
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsParametrosOracle: TDataSource
    DataSet = sdqParametrosOracle
    Left = 52
    Top = 368
  end
end
