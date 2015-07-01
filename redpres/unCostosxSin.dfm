inherited frmCostosxSin: TfrmCostosxSin
  Left = 250
  Top = 141
  Width = 759
  Height = 493
  Caption = 'Costos por Siniestro'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 751
    Height = 218
    object Label1: TLabel
      Left = 6
      Top = 198
      Width = 29
      Height = 13
      Caption = 'Fecha'
    end
    object Label2: TLabel
      Left = 155
      Top = 198
      Width = 16
      Height = 13
      Caption = '>>'
    end
    object ChkSin: TCheckPanel
      Left = 0
      Top = 0
      Width = 233
      Height = 38
      Caption = 'N'#250'mero de siniestro'
      TabOrder = 0
      Checked = False
      object Label4: TLabel
        Left = 113
        Top = 19
        Width = 16
        Height = 13
        Caption = '>>'
      end
      object SinDde: TSinEdit
        Left = 8
        Top = 16
        Width = 99
        Height = 20
        TabOrder = 0
      end
      object SinHta: TSinEdit
        Left = 131
        Top = 15
        Width = 99
        Height = 21
        TabOrder = 1
      end
    end
    object ChkCIE10: TCheckPanel
      Left = 235
      Top = 0
      Width = 511
      Height = 38
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Cie 10'
      TabOrder = 1
      Checked = False
      DesignSize = (
        511
        38)
      inline fraCIE10: TfraCIE10
        Left = 8
        Top = 13
        Width = 500
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited lbCIE10: TLabel
          Width = 37
        end
      end
    end
    object chkFAcc: TCheckPanel
      Left = 1
      Top = 40
      Width = 232
      Height = 36
      Caption = 'Fecha del accidente'
      TabOrder = 2
      Checked = False
      object Label3: TLabel
        Left = 109
        Top = 17
        Width = 16
        Height = 13
        Caption = '>>'
      end
      object faccdde: TDateComboBox
        Left = 8
        Top = 13
        Width = 96
        Height = 21
        TabOrder = 0
      end
      object facchta: TDateComboBox
        Left = 130
        Top = 13
        Width = 98
        Height = 21
        TabOrder = 1
      end
    end
    object ChkGTrab: TCheckPanel
      Left = 235
      Top = 40
      Width = 338
      Height = 36
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Grupo de trabajo'
      TabOrder = 3
      Checked = False
      DesignSize = (
        338
        36)
      inline fraGrupoTrabajo: TfraGrupoTrabajo
        Left = 6
        Top = 11
        Width = 326
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        inherited lblGestor: TLabel
          Left = 155
          Width = 32
        end
        inherited cmbGestor: TArtComboBox
          Left = 191
        end
        inherited cmbDescripcion: TArtComboBox
          Width = 101
        end
      end
    end
    object Chkdeleg: TCheckPanel
      Left = 575
      Top = 40
      Width = 172
      Height = 36
      Anchors = [akTop, akRight]
      Caption = 'Delegaci'#243'n'
      TabOrder = 4
      Checked = False
      inline fraDeleg: TfraCodigoDescripcion
        Left = 7
        Top = 12
        Width = 162
        Height = 22
        TabOrder = 0
        inherited cmbDescripcion: TArtComboBox
          Width = 97
        end
      end
    end
    object ChkEmpresa: TCheckPanel
      Left = 2
      Top = 154
      Width = 745
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Empresa'
      TabOrder = 5
      Checked = False
      DesignSize = (
        745
        39)
      inline fraEmpresa: TfraEmpresa
        Left = 10
        Top = 13
        Width = 731
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited lbContrato: TLabel
          Left = 627
        end
        inherited edContrato: TIntEdit
          Left = 672
        end
        inherited cmbRSocial: TArtComboBox
          Width = 490
        end
      end
    end
    object ChkPrestador: TCheckPanel
      Left = 2
      Top = 76
      Width = 745
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador de cabecera'
      TabOrder = 6
      Checked = False
      DesignSize = (
        745
        39)
      inline Prestador: TfraPrestador
        Left = 7
        Top = 13
        Width = 733
        Height = 24
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCUIT: TLabel
          Top = 6
          Width = 24
        end
        inherited lbSec: TLabel
          Top = 6
          Width = 21
        end
        inherited lbIdentif: TLabel
          Top = 6
          Width = 40
        end
        inherited lbRSocial: TLabel
          Top = 6
          Width = 38
        end
        inherited lbDomicilio: TLabel
          Width = 40
        end
        inherited lbLocalidad: TLabel
          Width = 44
        end
        inherited lbCPostal: TLabel
          Left = 638
          Width = 13
        end
        inherited cmbPrestador: TArtComboBox
          Width = 387
        end
        inherited edPresLocalidad: TEdit
          Width = 263
        end
        inherited edPresCPostal: TEdit
          Left = 662
        end
      end
    end
    object ChkPrestadorGt: TCheckPanel
      Left = 3
      Top = 115
      Width = 744
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador del gasto'
      TabOrder = 7
      Checked = False
      DesignSize = (
        744
        39)
      inline PrestadorGasto: TfraPrestador
        Left = 7
        Top = 13
        Width = 733
        Height = 23
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        AutoScroll = False
        TabOrder = 0
        inherited lbCUIT: TLabel
          Top = 6
          Width = 24
        end
        inherited lbSec: TLabel
          Top = 6
          Width = 21
        end
        inherited lbIdentif: TLabel
          Top = 6
          Width = 40
        end
        inherited lbRSocial: TLabel
          Top = 6
          Width = 38
        end
        inherited lbDomicilio: TLabel
          Width = 40
        end
        inherited lbLocalidad: TLabel
          Width = 44
        end
        inherited lbCPostal: TLabel
          Left = 638
          Width = 13
        end
        inherited cmbPrestador: TArtComboBox
          Width = 387
        end
        inherited edPresLocalidad: TEdit
          Width = 263
        end
        inherited edPresCPostal: TEdit
          Left = 662
        end
      end
    end
    object Fhta: TDateComboBox
      Left = 176
      Top = 195
      Width = 100
      Height = 21
      TabOrder = 9
    end
    object Fdde: TDateComboBox
      Left = 46
      Top = 195
      Width = 98
      Height = 21
      TabOrder = 8
    end
  end
  inherited CoolBar: TCoolBar
    Top = 218
    Width = 751
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 747
      end>
    inherited ToolBar: TToolBar
      Width = 734
      HotImages = frmPrincipal.imgGenColor
      Images = frmPrincipal.imgGenBW
      inherited tbRefrescar: TToolButton
        ImageIndex = 4
      end
      inherited tbNuevo: TToolButton
        ImageIndex = 23
      end
      inherited tbModificar: TToolButton
        ImageIndex = 24
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 25
      end
      inherited tbPropiedades: TToolButton
        ImageIndex = 15
      end
      inherited tbLimpiar: TToolButton
        ImageIndex = 3
      end
      inherited tbOrdenar: TToolButton
        ImageIndex = 5
      end
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 21
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 7
      end
      inherited tbExportar: TToolButton
        ImageIndex = 1
      end
      inherited tbMostrarFiltros: TToolButton
        ImageIndex = 17
      end
      inherited tbMaxRegistros: TToolButton
        ImageIndex = 5
      end
      inherited tbSalir: TToolButton
        ImageIndex = 8
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 247
    Width = 751
    Height = 219
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TitleFont.Name = 'Tahoma'
    Columns = <
      item
        Expanded = False
        FieldName = 'UTILES.ARMAR_SINIESTRO(EX_SINIESTRO,EX_ORDEN,EX_RE'
        Title.Caption = 'Siniestro'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TJ_NOMBRE'
        Title.Caption = 'Paciente'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MP_NOMBRE'
        Title.Caption = 'Empresa'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NVL(EX_FECHARECAIDA,EX_FECHAACCIDENTE)'
        Title.Caption = 'F.Accidente'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Caption = 'Alta M'#233'dica'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX_DIAGNOSTICOOMS'
        Title.Caption = 'Cie10'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Prestador'
        Width = 290
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GP_NOMBRE'
        Title.Caption = 'G. Trabajo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario Gestor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LG_NOMBRE'
        Title.Caption = 'Delegaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROTESIS'
        Title.Caption = 'Pr'#243'tesis'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMBULATORIAS'
        Title.Caption = 'Pres. Ambulatorias'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERNACIONES'
        Title.Caption = 'Internaciones'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MEDICAMENTOS'
        Title.Caption = 'Medicamentos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUIRURGICAS'
        Title.Caption = 'Int. Quir'#250'rgicas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESPECIALES'
        Title.Caption = 'Prac. Especiales'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMBULANCIAS'
        Title.Caption = 'Ambulancias'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRASLADOS'
        Title.Caption = 'Traslados'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOSPEDAJE'
        Title.Caption = 'Hospedaje'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FKT'
        Title.Caption = 'F.K.T.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOCIOAMB'
        Title.Caption = 'Adec. Socioamb.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PSICO'
        Title.Caption = 'Eval. Psico.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOAPROB'
        Title.Caption = 'Liq. No Aprob.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39'GASTOSESTIMADOS'#39
        Title.Caption = 'Gastos Estimados'
        Visible = True
      end>
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT '
      
        'utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida, '#39'-'#39'),' +
        '  '
      'tj_nombre, mp_nombre, NVL(ex_fecharecaida, ex_fechaaccidente), '
      
        'ex_altamedica, ex_diagnosticooms, ca_descripcion, gp_nombre, lg_' +
        'nombre,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ', TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'DD' +
        '/MM/YYYY'#39'), 2,  NULL ) '
      
        '+ art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,' +
        'TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'DD/M' +
        'M/YYYY'#39'), 26,  NULL ) Protesis,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 22,  NULL ) Ambulatorias,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ', TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'DD' +
        '/MM/YYYY'#39'), 23,  NULL ) '
      
        '+ art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,' +
        '  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'DD' +
        '/MM/YYYY'#39'), 72,  NULL ) Internaciones,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 24,  NULL ) '
      
        '+ art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,' +
        '  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'DD' +
        '/MM/YYYY'#39'), 1,  NULL ) Medicamentos,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 28,  NULL ) Quirurgicas,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 29,  NULL ) Especiales,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 30,  NULL ) Ambulancias,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 68,  NULL ) '
      
        '+ art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,' +
        '  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'DD' +
        '/MM/YYYY'#39'), 27,  NULL ) Traslados,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 69,  NULL ) '
      
        '+ art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida,' +
        '  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'DD' +
        '/MM/YYYY'#39'), 7,  NULL ) Hospedaje,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 70,  NULL ) FKT,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 73,  NULL ) Socioamb,'
      
        '   art.liq.Get_ImpLiqConcepto(ex_siniestro, ex_orden, ex_recaida' +
        ',  TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'D' +
        'D/MM/YYYY'#39'), 76,  NULL ) Psico,'
      
        '   art.liq.Get_ImpLiqNoAut(ex_siniestro, ex_orden, ex_recaida,  ' +
        'TO_DATE('#39'01/08/2002'#39', '#39'DD/MM/YYYY'#39'), TO_DATE('#39'05/08/2002'#39', '#39'DD/M' +
        'M/YYYY'#39'),  NULL ) NoAprob,'
      
        '   '#39'Gastos Estimados'#39' , siniestro.get_usuariogestor(ex_id) USUGE' +
        'STOR'
      
        'FROM ART.dlg_delegaciones, ART.mgp_gtrabajo, ART.cpr_prestador, ' +
        'ART.cmp_empresas, '
      '           ART.ctj_trabajadores, ART.sex_expedientes '
      'WHERE ex_cuil = tj_cuil AND ex_cuit = mp_cuit AND '
      
        '               ex_prestador = ca_identificador (+) AND ex_gtraba' +
        'jo = gp_codigo AND '
      '               NVL(ex_causafin, '#39'0'#39') NOT IN ('#39'99'#39','#39'95'#39') AND '
      
        '               ex_delegacion = lg_codigo AND ex_siniestro betwee' +
        'n 1818 and 1818 AND '
      '              ex_diagnosticooms ='#39'T32.9'#39' AND '
      
        '              ex_fechaaccidente between TO_DATE('#39'02/08/1995'#39', '#39'D' +
        'D/MM/YYYY'#39') and TO_DATE('#39'05/08/2002'#39', '#39'DD/MM/YYYY'#39') AND '
      '             ex_gtrabajo =22 AND ex_delegacion =840 '
      '')
    Left = 16
    Top = 372
  end
  inherited dsConsulta: TDataSource
    Left = 44
    Top = 372
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'Siniestro'
        DataField = 'UTILES.ARMAR_SINIESTRO(EX_SINIESTRO,EX_ORDEN,EX_RE'
        FieldIndex = 0
      end
      item
        Title = 'Paciente'
        DataField = 'TJ_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Empresa'
        DataField = 'MP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'F.Accidente'
        DataField = 'NVL(EX_FECHARECAIDA,EX_FECHAACCIDENTE)'
        FieldIndex = 0
      end
      item
        Title = 'Alta M'#233'dica'
        DataField = 'EX_ALTAMEDICA'
        FieldIndex = 0
      end
      item
        Title = 'Cie10'
        DataField = 'EX_DIAGNOSTICOOMS'
        FieldIndex = 0
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 0
      end
      item
        Title = 'G.Trabajo'
        DataField = 'GP_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        FieldIndex = 0
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'LG_NOMBRE'
        FieldIndex = 0
      end
      item
        Title = 'Pr'#243'tesis'
        DataField = 'PROTESIS'
        FieldIndex = 0
      end
      item
        Title = 'Pres. Ambulatorias'
        DataField = 'AMBULATORIAS'
        FieldIndex = 0
      end
      item
        Title = 'Internaciones'
        DataField = 'INTERNACIONES'
        FieldIndex = 0
      end
      item
        Title = 'Medicamentos'
        DataField = 'MEDICAMENTOS'
        FieldIndex = 0
      end
      item
        Title = 'Int. Quir'#250'rgicas'
        DataField = 'QUIRURGICAS'
        FieldIndex = 0
      end
      item
        Title = 'Prac. Especiales'
        DataField = 'ESPECIALES'
        FieldIndex = 0
      end
      item
        Title = 'Ambulancias'
        DataField = 'AMBULANCIAS'
        FieldIndex = 0
      end
      item
        Title = 'Traslados'
        DataField = 'TRASLADOS'
        FieldIndex = 0
      end
      item
        Title = 'Hospedaje'
        DataField = 'HOSPEDAJE'
        FieldIndex = 0
      end
      item
        Title = 'F.K.T.'
        DataField = 'FKT'
        FieldIndex = 0
      end
      item
        Title = 'Adec. Socioamb.'
        DataField = 'SOCIOAMB'
        FieldIndex = 0
      end
      item
        Title = 'Eval. Psico.'
        DataField = 'PSICO'
        FieldIndex = 0
      end
      item
        Title = 'Liq. No Aprob.'
        DataField = 'NOAPROB'
        FieldIndex = 0
      end
      item
        Title = 'Gastos Estimados'
        DataField = #39'GASTOSESTIMADOS'#39
        FieldIndex = 0
      end>
    Left = 16
    Top = 400
  end
  inherited ExportDialog: TExportDialog
    Fields = <
      item
        DataField = 'UTILES.ARMAR_SINIESTRO(EX_SINIESTRO,EX_ORDEN,EX_RE'
        Title = 'Siniestro'
      end
      item
        DataField = 'TJ_NOMBRE'
        Title = 'Paciente'
      end
      item
        DataField = 'MP_NOMBRE'
        Title = 'Empresa'
      end
      item
        DataField = 'NVL(EX_FECHARECAIDA,EX_FECHAACCIDENTE)'
        Title = 'F.Accidente'
      end
      item
        DataField = 'EX_ALTAMEDICA'
        Title = 'Alta M'#233'dica'
      end
      item
        DataField = 'EX_DIAGNOSTICOOMS'
        Title = 'Cie10'
      end
      item
        DataField = 'CA_DESCRIPCION'
        Title = 'Prestador'
      end
      item
        DataField = 'GP_NOMBRE'
        Title = 'G.Trabajo'
      end
      item
        DataField = 'USUGESTOR'
        Title = 'Usuario Gestor'
      end
      item
        DataField = 'LG_NOMBRE'
        Title = 'Delegaci'#243'n'
      end
      item
        DataField = 'PROTESIS'
        Title = 'Pr'#243'tesis'
      end
      item
        DataField = 'AMBULATORIAS'
        Title = 'Pres. Ambulatorias'
      end
      item
        DataField = 'INTERNACIONES'
        Title = 'Internaciones'
      end
      item
        DataField = 'MEDICAMENTOS'
        Title = 'Medicamentos'
      end
      item
        DataField = 'QUIRURGICAS'
        Title = 'Int. Quir'#250'rgicas'
      end
      item
        DataField = 'ESPECIALES'
        Title = 'Prac. Especiales'
      end
      item
        DataField = 'AMBULANCIAS'
        Title = 'Ambulancias'
      end
      item
        DataField = 'TRASLADOS'
        Title = 'Traslados'
      end
      item
        DataField = 'HOSPEDAJE'
        Title = 'Hospedaje'
      end
      item
        DataField = 'FKT'
        Title = 'F.K.T.'
      end
      item
        DataField = 'SOCIOAMB'
        Title = 'Adec. Socioamb.'
      end
      item
        DataField = 'PSICO'
        Title = 'Eval. Psico.'
      end
      item
        DataField = 'NOAPROB'
        Title = 'Liq. No Aprob.'
      end
      item
        DataField = #39'GASTOSESTIMADOS'#39
        Title = 'Gastos Estimados'
      end>
    Left = 44
    Top = 400
  end
  inherited QueryPrint: TQueryPrint
    Fields = <
      item
        Title = 'Siniestro'
        DataField = 'UTILES.ARMAR_SINIESTRO(EX_SINIESTRO,EX_ORDEN,EX_RE'
        MaxLength = 12
      end
      item
        Title = 'Paciente'
        DataField = 'TJ_NOMBRE'
        MaxLength = 23
      end
      item
        Title = 'Empresa'
        DataField = 'MP_NOMBRE'
        MaxLength = 35
      end
      item
        Title = 'F.Accid.'
        DataField = 'NVL(EX_FECHARECAIDA,EX_FECHAACCIDENTE)'
        MaxLength = 8
      end
      item
        Title = 'F.Alta'
        DataField = 'EX_ALTAMEDICA'
        MaxLength = 8
      end
      item
        Title = 'Cie10'
        DataField = 'EX_DIAGNOSTICOOMS'
        MaxLength = 6
      end
      item
        Title = 'Prestador'
        DataField = 'CA_DESCRIPCION'
        MaxLength = 35
      end
      item
        Title = 'G.Trabajo'
        DataField = 'GP_NOMBRE'
        MaxLength = 12
      end
      item
        Title = 'Usuario Gestor'
        DataField = 'USUGESTOR'
        MaxLength = 10
      end
      item
        Title = 'Delegaci'#243'n'
        DataField = 'LG_NOMBRE'
        MaxLength = 12
      end
      item
        Title = 'Prot.'
        DataField = 'PROTESIS'
        MaxLength = 6
      end
      item
        Title = 'Ambulat.'
        DataField = 'AMBULATORIAS'
        MaxLength = 6
      end
      item
        Title = 'Intern.'
        DataField = 'INTERNACIONES'
        MaxLength = 6
      end
      item
        Title = 'Medicam.'
        DataField = 'MEDICAMENTOS'
        MaxLength = 6
      end
      item
        Title = 'Quir'#250'rg.'
        DataField = 'QUIRURGICAS'
        MaxLength = 6
      end
      item
        Title = 'Especiales'
        DataField = 'ESPECIALES'
        MaxLength = 6
      end
      item
        Title = 'Ambulancias'
        DataField = 'AMBULANCIAS'
        MaxLength = 6
      end
      item
        Title = 'Traslados'
        DataField = 'TRASLADOS'
        MaxLength = 6
      end
      item
        Title = 'Hospedaje'
        DataField = 'HOSPEDAJE'
        MaxLength = 6
      end
      item
        Title = 'F.K.T.'
        DataField = 'FKT'
        MaxLength = 6
      end
      item
        Title = 'Socioamb.'
        DataField = 'SOCIOAMB'
        MaxLength = 6
      end
      item
        Title = 'Psico.'
        DataField = 'PSICO'
        MaxLength = 6
      end
      item
        Title = 'No Aprob.'
        DataField = 'NOAPROB'
        MaxLength = 6
      end
      item
        Title = 'Gastos Estimados'
        DataField = #39'GASTOSESTIMADOS'#39
        Visible = False
        MaxLength = 16
      end>
    PageOrientation = pxLandscape
    PageSize = psLegal
    Left = 44
    Top = 428
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 15
    Top = 344
  end
  inherited FormStorage: TFormStorage
    Left = 44
    Top = 344
  end
  inherited PrintDialog: TPrintDialog
    Left = 16
    Top = 428
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end>
    Left = 72
    Top = 344
  end
  inherited FieldHider: TFieldHider
    Left = 72
    Top = 372
  end
end
