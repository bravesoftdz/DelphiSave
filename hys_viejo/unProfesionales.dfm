inherited frmProfesionales: TfrmProfesionales
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Profesionales'
  ClientHeight = 563
  ClientWidth = 782
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 782
  end
  inherited CoolBar: TCoolBar
    Width = 782
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 778
      end>
    inherited ToolBar: TToolBar
      Width = 765
      inherited tbSalir: TToolButton
        Visible = False
      end
      object tbInformarFaltanteProfesional: TToolButton
        Left = 370
        Top = 0
        Hint = 'Informar Datos Faltantes'
        Caption = 'tbInformarFaltanteProfesional'
        ImageIndex = 31
        OnClick = tbInformarFaltanteProfesionalClick
      end
      object Label12: TLabel
        Left = 393
        Top = 0
        Width = 44
        Height = 22
        Caption = '     (4 y 5)'
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 782
    Height = 489
    Columns = <
      item
        Expanded = False
        FieldName = 'PR_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_NROMATRICULA'
        Title.Caption = 'Nro. Matricula'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_INSTOTORGANTE'
        Title.Caption = 'Instuto Otorgante'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_TITULO'
        Title.Caption = 'Titulo'
        Width = 156
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 180
    Top = 128
    Width = 518
    Height = 280
    inherited BevelAbm: TBevel
      Top = 244
      Width = 510
    end
    object Label1: TLabel [1]
      Left = 10
      Top = 215
      Width = 69
      Height = 13
      Caption = 'Cant. de horas'
    end
    object Label2: TLabel [2]
      Left = 10
      Top = 138
      Width = 67
      Height = 13
      Caption = 'Inst Otorgante'
    end
    object Label3: TLabel [3]
      Left = 10
      Top = 162
      Width = 28
      Height = 13
      Caption = 'T'#237'tulo'
    end
    object Label4: TLabel [4]
      Left = 10
      Top = 111
      Width = 68
      Height = 13
      Caption = 'Nro. Matr'#237'cula'
    end
    object Label5: TLabel [5]
      Left = 10
      Top = 86
      Width = 69
      Height = 13
      Caption = 'Tipo Matr'#237'cula'
    end
    object lblNombre: TLabel [6]
      Left = 10
      Top = 60
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label6: TLabel [7]
      Left = 10
      Top = 10
      Width = 47
      Height = 13
      Caption = 'Tipo Doc.'
    end
    object Label7: TLabel [8]
      Left = 10
      Top = 36
      Width = 24
      Height = 13
      Caption = 'CUIL'
    end
    object Label8: TLabel [9]
      Left = 14
      Top = 189
      Width = 62
      Height = 13
      Caption = 'Tipo Servicio'
    end
    inherited btnAceptar: TButton
      Left = 360
      Top = 250
      TabOrder = 9
    end
    inherited btnCancelar: TButton
      Left = 438
      Top = 250
      TabOrder = 10
    end
    object edNombre: TEdit
      Left = 85
      Top = 57
      Width = 428
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      TabOrder = 2
    end
    object cbTipoMatricula: TExComboBox
      Left = 86
      Top = 82
      Width = 428
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 3
      Items.Strings = (
        '1=RUGU'
        '2=RUTH'
        '3=Matr'#237'cula Profesional')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
    object edNroMatricula: TPatternEdit
      Left = 86
      Top = 108
      Width = 427
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 15
      TabOrder = 4
    end
    object edTitulo: TEdit
      Left = 87
      Top = 159
      Width = 424
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 30
      TabOrder = 6
    end
    object edInstOtorgante: TEdit
      Left = 86
      Top = 134
      Width = 425
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 60
      TabOrder = 5
    end
    inline fraTipoServicio: TfraCodigoDescripcion
      Left = 86
      Top = 184
      Width = 427
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
      inherited cmbDescripcion: TArtComboBox
        Width = 362
      end
    end
    inline fraTipoDoc: TfraStaticCTB_TABLAS
      Left = 85
      Top = 6
      Width = 430
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited edCodigo: TPatternEdit
        Left = 0
      end
      inherited cmbDescripcion: TComboGrid
        Width = 366
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja'
          'TB_CLAVE'
          'TB_ESPECIAL1')
        ColWidths = (
          40
          300
          -1
          -1
          -1
          -1)
      end
    end
    object edDocumento: TMaskEdit
      Left = 85
      Top = 32
      Width = 81
      Height = 21
      EditMask = '99-########-c;0; '
      MaxLength = 13
      TabOrder = 1
    end
    object edCantHoras: TIntEdit
      Left = 88
      Top = 211
      Width = 90
      Height = 21
      TabOrder = 8
      Alignment = taRightJustify
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT pr_id, pr_idinforme, pr_tipodocumento, pr_documento, pr_n' +
        'ombre, pr_tipomatricula, pr_nromatricula, pr_instotorgante,'
      
        '       pr_titulo, pr_tiposervicio, pr_canthoras, pr_usualta, pr_' +
        'fechaalta, pr_usumodif, pr_fechamodif, pr_usubaja, pr_fechabaja'
      '  FROM hys.hpr_profesionales'
      ' WHERE pr_idinforme = :idinforme')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idinforme'
        ParamType = ptInput
      end>
  end
end
