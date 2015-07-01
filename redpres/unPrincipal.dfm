object frmPrincipal: TfrmPrincipal
  Left = 356
  Top = 149
  ClientHeight = 488
  ClientWidth = 818
  Color = 4309662
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnuPrincipal
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object imgLogoMUTUAL: TImage
    Left = 152
    Top = 36
    Width = 209
    Height = 57
    Visible = False
  end
  object imgLogo: TImage
    Left = 261
    Top = 97
    Width = 213
    Height = 39
    Visible = False
  end
  object imgLogoGob: TImage
    Left = 253
    Top = 145
    Width = 213
    Height = 39
    Visible = False
  end
  object Sb_BarraDeEstado: TStatusBar
    Left = 0
    Top = 465
    Width = 818
    Height = 23
    Panels = <>
    SimpleText = 'Listo...'
  end
  object mnuPrincipal: TMainMenu
    Images = ilImagenes
    Left = 116
    Top = 4
    object mnuPresMed: TMenuItem
      Caption = 'Prestaciones m'#233'dicas'
      object mnuParteEvolutivo: TMenuItem
        Caption = 'Parte evolutivo'
        object mnuParteEvolutivoCarga: TMenuItem
          Caption = 'Carga de partes evolutivos'
          OnClick = mnuParteEvolutivoCargaClick
        end
        object N4: TMenuItem
          Caption = '-'
        end
        object mnuCambGrupoTrabajo: TMenuItem
          Caption = 'Cambio del grupo de trabajo'
          OnClick = mnuCambGrupoTrabajoClick
        end
      end
      object mnuAutorizaciones: TMenuItem
        Caption = 'Autorizaciones'
        object mnuAutCarga: TMenuItem
          Caption = 'Carga'
          OnClick = mnuAutCargaClick
        end
        object mnuAutAprobacion: TMenuItem
          Caption = 'Aprobaci'#243'n'
          ImageIndex = 4
          OnClick = mnuAutAprobacionClick
        end
        object mnuAutConsulta: TMenuItem
          Caption = 'Consulta de Autorizaciones'
          OnClick = mnuAutConsultaClick
        end
        object mnuOrtopedia: TMenuItem
          Caption = 'Ortopedia'
          object mnuConsAlquileresOrt: TMenuItem
            Caption = 'Consulta de Alquileres'
            OnClick = mnuConsAlquileresOrtClick
          end
          object mnuConsRecuperoOrt: TMenuItem
            Caption = 'Consulta de Recupero'
            OnClick = mnuConsRecuperoOrtClick
          end
          object mnuConsStockOrt: TMenuItem
            Caption = 'Material en Stock'
            OnClick = mnuConsStockOrtClick
          end
        end
        object mnuConsultaPresupuestos: TMenuItem
          Caption = 'Consulta Presupuestos'
          OnClick = mnuConsultaPresupuestosClick
        end
        object N19: TMenuItem
          Caption = '-'
        end
        object mnuAgendaDeLosMediosDeTransporte: TMenuItem
          Caption = 'Agenda de medios de transporte'
          OnClick = mnuAgendaDeLosMediosDeTransporteClick
        end
      end
      object mnuLiquidaciones: TMenuItem
        Caption = 'Liquidaciones'
        object mnuLiquiRecepcion: TMenuItem
          Caption = 'Recepci'#243'n de Facturas'
          OnClick = mnuLiquiRecepcionClick
        end
        object mnuRecepcionVolantes: TMenuItem
          Caption = 'Recepci'#243'n de Volantes'
          object mrnLiqRecepVolantes: TMenuItem
            Caption = 'Volantes del Interior'
            OnClick = mrnLiqRecepVolantesClick
          end
          object mnuLiqRecepcionAuditoria: TMenuItem
            Caption = 'Auditor'#237'a'
            OnClick = mnuLiqRecepcionAuditoriaClick
          end
          object mnuLiqRecepOrtopedia: TMenuItem
            Caption = 'Control de Prestaciones'
            OnClick = mnuLiqRecepOrtopediaClick
          end
          object mnuLiqRecepLiquidaciones: TMenuItem
            Caption = 'Liquidaciones'
            OnClick = mnuLiqRecepLiquidacionesClick
          end
        end
        object mnuReimpVolantes: TMenuItem
          Caption = 'Reimpresi'#243'n de Volantes'
          Visible = False
          OnClick = mnuReimpVolantesClick
        end
        object mnuLiquiConsVol: TMenuItem
          Caption = 'Consulta de Volantes'
          OnClick = mnuLiquiConsVolClick
        end
        object mnuLiquiListApro: TMenuItem
          Caption = 'Liquidaciones Aprobadas'
          OnClick = mnuLiquiListAproClick
        end
        object N1: TMenuItem
          Caption = '-'
        end
        object mnuLiquiAprobacion: TMenuItem
          Caption = 'Aprobaci'#243'n'
          ImageIndex = 4
          OnClick = mnuLiquiAprobacionClick
        end
        object mnuLiquiAutPago: TMenuItem
          Caption = 'Autorizaci'#243'n del Pago'
          OnClick = mnuLiquiAutPagoClick
        end
        object mnuLiquiPorSiniestro: TMenuItem
          Caption = 'Por Siniestro'
          object mnuLiquiIngreso: TMenuItem
            Caption = 'Ingreso'
            OnClick = mnuLiquiIngresoClick
          end
          object mnuIngresoMasivo: TMenuItem
            Caption = 'Ingreso masivo'
            Hint = 'RECVO'
            OnClick = ImpoExpo
          end
          object N3: TMenuItem
            Caption = '-'
          end
          object mnuLiquiImputPagos: TMenuItem
            Caption = 'Imputaci'#243'n de Pagos'
            OnClick = mnuLiquiImputPagosClick
          end
        end
        object mnuLiquiGenrica: TMenuItem
          Caption = 'Gen'#233'rica'
          object mnuLiquiCarGen: TMenuItem
            Caption = 'Ingreso'
            OnClick = mnuLiquiCarGenClick
          end
        end
        object mnuListHistoricoVolantes: TMenuItem
          Caption = 'Hist'#243'rico de Volantes'
          OnClick = mnuListHistoricoVolantesClick
        end
        object mnuLiqAMP: TMenuItem
          Caption = 'AMP'
          object mnuLiqAMPCarga: TMenuItem
            Caption = 'Carga'
            OnClick = mnuLiqAMPCargaClick
          end
          object mnuLiqAMPAprob: TMenuItem
            Caption = 'Aprobaci'#243'n'
            OnClick = mnuLiqAMPAprobClick
          end
          object mnuLiqAMPAutPago: TMenuItem
            Caption = 'Autorizaci'#243'n Pago'
            OnClick = mnuLiqAMPAutPagoClick
          end
        end
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuPedInfo: TMenuItem
        Caption = 'Pedidos de informaci'#243'n'
        OnClick = mnuPedInfoClick
      end
      object mnuCartasPrestador: TMenuItem
        Caption = 'Cartas al prestador'
        object mnuCartaRechPr: TMenuItem
          Caption = 'Cartas de rechazo'
          OnClick = mnuCartaRechPrClick
        end
        object mnuNotificacionAltasPr: TMenuItem
          Caption = 'Notificaci'#243'n de altas'
          OnClick = mnuNotificacionAltasPrClick
        end
        object mnuAuditConsultorio: TMenuItem
          Caption = 'Auditor'#237'a en consultorio'
          OnClick = mnuAuditConsultorioClick
        end
      end
      object mnuViajesalExterior: TMenuItem
        Caption = '&Viajes al exterior'
        OnClick = mnuViajesalExteriorClick
      end
      object mnuManejodeConsultorio: TMenuItem
        Caption = 'Manejo de &consultorio'
        OnClick = mnuManejodeConsultorioClick
      end
      object mnuRequerimientosSRT: TMenuItem
        Caption = '&Requerimientos SRT'
        OnClick = mnuRequerimientosSRTClick
      end
      object mnuSeguimientoAuditoriasMedicas: TMenuItem
        Caption = 'Seguimiento de auditor'#237'as m'#233'dicas'
        OnClick = mnuSeguimientoAuditoriasMedicasClick
      end
      object mnuDocumentacion: TMenuItem
        Caption = 'Documentaci'#243'n'
        OnClick = mnuDocumentacionClick
      end
      object mnuDevolucionFacturas: TMenuItem
        Caption = 'Devoluci'#243'n de facturas'
        OnClick = mnuDevolucionFacturasClick
      end
    end
    object mnuSegExpe: TMenuItem
      Caption = 'Seguimiento de expedientes'
      object mnuAbandonoTratamiento: TMenuItem
        Caption = 'Abandono de tratamiento'
        OnClick = mnuAbandonoTratamientoClick
      end
      object mnuRatifAlta: TMenuItem
        Caption = '&Ratificaci'#243'n de alta'
        OnClick = mnuRatifAltaClick
      end
      object MnuSeguimientoMedico: TMenuItem
        Caption = 'Seguimiento m'#233'dico'
        object MnuRecalificacin: TMenuItem
          Caption = 'Recalificaci'#243'n'
          object MnuSegMedRecalificacion: TMenuItem
            Caption = 'Seg. recalificaci'#243'n'
            OnClick = MnuSegMedRecalificacionClick
          end
          object ListadosdeRecalificacion1: TMenuItem
            Caption = '&Listados recalificaci'#243'n'
            object mnuListRecalGen: TMenuItem
              Caption = '&Gen'#233'ricos'
              OnClick = mnuListRecalGenClick
            end
            object mnuListRecalEven: TMenuItem
              Caption = 'Por &Evento'
              OnClick = mnuListRecalEvenClick
            end
            object MnuRecalificacionSRT: TMenuItem
              Caption = 'Recalificaci'#243'n SRT'
              OnClick = MnuRecalificacionSRTClick
            end
            object mnuIngresosSRT: TMenuItem
              Caption = 'Ingresos SRT'
              OnClick = mnuIngresosSRTClick
            end
            object mnuSeguimientos: TMenuItem
              Caption = 'Seguimientos'
              OnClick = mnuSeguimientosClick
            end
            object mnuEventosAutorizacion: TMenuItem
              Caption = 'Eventos que generan autorizaci'#243'n'
              OnClick = mnuEventosAutorizacionClick
            end
          end
          object MnuImportaciningresoSRT: TMenuItem
            Caption = 'Importaci'#243'n ingreso SRT'
            Hint = 'SRTFI'
            OnClick = ImpoExpo
          end
          object mnuRecalifMantenimiento: TMenuItem
            Caption = 'Mantenimiento'
            object mnuMantRecalifEventos: TMenuItem
              Caption = 'Eventos'
              OnClick = mnuMantRecalifEventosClick
            end
          end
        end
        object mnuPacientesCronicos: TMenuItem
          Caption = 'Pacientes cr'#243'nicos'
          object mnuSegCronicos: TMenuItem
            Caption = 'Seguimiento'
            OnClick = mnuSegCronicosClick
          end
          object mnuMedicamentosCronicos: TMenuItem
            Caption = 'Medicamentos'
            OnClick = mnuMedicamentosCronicosClick
          end
          object mnuImportMedicCron: TMenuItem
            Caption = 'Importaci'#243'n medicamentos'
            Hint = 'AC_ME'
            OnClick = ImpoExpo
          end
        end
      end
      object mnuSuspensionPlazos: TMenuItem
        Caption = '&Susp - Acep - Recha'
        OnClick = mnuSuspensionPlazosClick
      end
      object mnuCeseILT: TMenuItem
        Caption = 'Cese de ILT'
        OnClick = mnuCeseILTClick
      end
      object mnuAdministracionCartas: TMenuItem
        Caption = 'Administraci'#243'n de cartas'
        OnClick = mnuAdministracionCartasClick
      end
      object MnuRemitosCartas: TMenuItem
        Caption = 'Remitos de cartas'
        OnClick = MnuRemitosCartasClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object MnuCambioCuitSin: TMenuItem
        Caption = 'Cambio de CUIT de un siniestro'
        OnClick = MnuCambioCuitSinClick
      end
      object MnuTelegramas: TMenuItem
        Caption = 'Telegramas'
        object mnuRecepcionTelegramas: TMenuItem
          Caption = 'Recepci'#243'n de telegramas'
          Hint = 'TLG'
          OnClick = ImpoExpo
        end
        object MnuGeneracionTelegramas: TMenuItem
          Caption = 'Generaci'#243'n de archivo de Telegramas - Correo'
          Hint = 'TELE'
          OnClick = ImpoExpo
        end
        object MnuTelefonogramas: TMenuItem
          Caption = 'Telefonogramas'
          OnClick = MnuTelefonogramasClick
        end
      end
      object mnuSegExpMantenimiento: TMenuItem
        Caption = 'Mantenimiento'
        object mnuSegExpManEventos: TMenuItem
          Caption = 'Eventos'
          OnClick = mnuSegExpManEventosClick
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object mnuMantCartasDoc: TMenuItem
          Caption = 'Cartas documento'
          object mnuManTextosCartas: TMenuItem
            Caption = 'Textos libres'
            OnClick = mnuManTextosCartasClick
          end
          object mnuTextosdeCartasDocumentos: TMenuItem
            Caption = 'Textos de cartas documentos'
            OnClick = mnuTextosdeCartasDocumentosClick
          end
          object mnuTextosdeCartasDocumentosaTrab: TMenuItem
            Caption = 'Textos de cartas documentos a trabajadores'
            OnClick = mnuTextosdeCartasDocumentosaTrabClick
          end
          object N16: TMenuItem
            Caption = '-'
          end
          object mnuManAreasCartasDoc: TMenuItem
            Caption = 'Areas'
            OnClick = mnuManAreasCartasDocClick
          end
          object MnuManCodRecepcion: TMenuItem
            Caption = 'C'#243'digos de recepci'#243'n'
            OnClick = MnuManCodRecepcionClick
          end
          object mnuManFirmantesCartas: TMenuItem
            Caption = 'Firmantes'
            OnClick = mnuManFirmantesCartasClick
          end
        end
        object mnuSMS: TMenuItem
          Caption = 'SMS'
          object mnuMantenimientoTextosSMS: TMenuItem
            Caption = 'Textos de los SMS'
            OnClick = mnuMantenimientoTextosSMSClick
          end
        end
      end
    end
    object mnuListados: TMenuItem
      Caption = 'Listados'
      object mnuConsSin: TMenuItem
        Caption = 'Consulta de siniestros'
        OnClick = mnuConsSinClick
      end
      object mnuConsultaPrestadores: TMenuItem
        Caption = 'Consulta de prestadores'
        OnClick = mnuConsultaPrestadoresClick
      end
      object mnuInformeEvol: TMenuItem
        Caption = 'Informe evoluci'#243'n'
        OnClick = mnuInformeEvolClick
      end
      object mnuAgenda: TMenuItem
        Caption = 'Agenda'
        OnClick = mnuAgendaClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuCargaDiaria: TMenuItem
        Caption = 'Carga diaria'
        OnClick = mnuCargaDiariaClick
      end
      object mnuPasientesInternados: TMenuItem
        Caption = 'Pacientes que contin'#250'an internados'
        Visible = False
        OnClick = mnuPasientesInternadosClick
      end
      object mnuListSiniestrosConInternacion: TMenuItem
        Caption = 'Siniestros con internaci'#243'n'
        OnClick = mnuListSiniestrosConInternacionClick
      end
      object mnuListPasSinEvo: TMenuItem
        Caption = 'Pacientes sin evoluci'#243'n'
        OnClick = mnuListPasSinEvoClick
      end
      object mnuListDiasCados: TMenuItem
        Caption = 'Control de d'#237'as ca'#237'dos'
        OnClick = mnuListDiasCadosClick
      end
      object mnuListOpProg: TMenuItem
        Caption = 'Operaciones programadas'
        OnClick = mnuListOpProgClick
      end
      object mnuListPorEmpr: TMenuItem
        Caption = 'Siniestros por empresa'
        OnClick = mnuListPorEmprClick
      end
      object mnuListSiniSinAltaMed: TMenuItem
        Caption = 'Siniestros sin alta m'#233'dica'
        OnClick = mnuListSiniSinAltaMedClick
      end
      object MnuSinSEvo: TMenuItem
        Caption = 'Siniestros sin evolucionar'
        OnClick = MnuSinSEvoClick
      end
      object mnuContinaTratamientosinalta: TMenuItem
        Caption = 'Contin'#250'a tratamiento sin alta'
        OnClick = mnuContinaTratamientosinaltaClick
      end
      object mnuListSeguimientoMedico: TMenuItem
        Caption = 'Seguimiento m'#233'dico'
        OnClick = mnuListSeguimientoMedicoClick
      end
      object mnuListExamenesPreocupacionales: TMenuItem
        Caption = 'Examenes preocupacionales'
        OnClick = mnuListExamenesPreocupacionalesClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnuListCostos: TMenuItem
        Caption = 'Costos'
        object mnuCostosporCIE10: TMenuItem
          Caption = 'Costos por CIE10'
          OnClick = mnuCostosporCIE10Click
        end
        object mnuCostosporSiniestro: TMenuItem
          Caption = 'Costos por siniestro'
          OnClick = mnuCostosporSiniestroClick
        end
      end
      object Rehabilitacin1: TMenuItem
        Caption = 'Rehabilitaci'#243'n'
        object mnuPorTratamiento: TMenuItem
          Caption = '&Por tratamiento'
          OnClick = mnuPorTratamientoClick
        end
        object mnuCostos: TMenuItem
          Caption = '&Costos'
          OnClick = mnuCostosClick
        end
      end
      object mnuLstWeb: TMenuItem
        Caption = 'Web'
        object mnuLstWebMigracion: TMenuItem
          Caption = 'Migraci'#243'n'
          OnClick = mnuLstWebMigracionClick
        end
        object mnuLstWebRecepcionParte: TMenuItem
          Caption = 'Recepci'#243'n de partes'
          OnClick = mnuLstWebRecepcionParteClick
        end
        object mnuRecepcionPartesGenerales: TMenuItem
          Caption = 'Recepci'#243'n de partes generales'
          OnClick = mnuRecepcionPartesGeneralesClick
        end
        object mnuListRecepcionPartesMail: TMenuItem
          Caption = 'Recepci'#243'n de partes por mail'
          OnClick = mnuListRecepcionPartesMailClick
        end
      end
      object TMenuItem
        Caption = '-'
      end
      object mnuSiniestrosTopeados: TMenuItem
        Caption = 'Siniestros Topeados'
        OnClick = mnuSiniestrosTopeadosClick
      end
      object mnuServiciosAEmpresas: TMenuItem
        Caption = 'Servicios a Empresas'
        OnClick = mnuServiciosAEmpresasClick
      end
      object mnuListLiquidaciones: TMenuItem
        Caption = 'Liquidaciones'
        object mnuReportePLA: TMenuItem
          Caption = 'Reporte PLA'
          OnClick = mnuReportePLAClick
        end
        object mnuEgresosSemanales: TMenuItem
          Caption = 'Egresos Semanales'
          OnClick = mnuEgresosSemanalesClick
        end
        object mnuTableroControl: TMenuItem
          Caption = 'Tablero de control'
          OnClick = mnuTableroControlClick
        end
      end
      object mnuAMF: TMenuItem
        Caption = 'AMF'
        object mnuReportePorAuditor: TMenuItem
          Caption = 'Reporte por auditor'
          OnClick = mnuReportePorAuditorClick
        end
        object mnuTableroControlAMF: TMenuItem
          Caption = 'Tablero de control'
          OnClick = mnuTableroControlAMFClick
        end
      end
    end
    object mnuMantenimiento: TMenuItem
      Caption = 'Mantenimiento'
      object mnuAuditores: TMenuItem
        Caption = '&Auditores'
        OnClick = mnuAuditoresClick
      end
      object mnuDocumentos: TMenuItem
        Caption = 'Documentos solicitados'
        OnClick = mnuDocumentosClick
      end
      object mnuFirmantes: TMenuItem
        Caption = 'Firmantes'
        OnClick = mnuFirmantesClick
      end
      object mnuMantGrpTrabajo: TMenuItem
        Caption = 'Grupos de trabajo'
        Visible = False
        OnClick = mnuMantGrpTrabajoClick
      end
      object mnuMantGrpTrabajo2: TMenuItem
        Caption = 'Grupos de Trabajo'
        OnClick = mnuMantGrpTrabajo2Click
      end
      object mnuMantPrestaciones: TMenuItem
        Caption = 'Prestaciones'
        OnClick = mnuMantPrestacionesClick
      end
      object mnuPrestadoresGeneral: TMenuItem
        Caption = 'Prestadores'
        object mnuMantPrestadores: TMenuItem
          Caption = 'Prestadores'
          OnClick = mnuMantPrestadoresClick
        end
        object N17: TMenuItem
          Caption = '-'
        end
        object mnuConsultaDePresupuestosySolicitudes: TMenuItem
          Caption = 'Consulta de presupuestos y solicitudes AMP'
          OnClick = mnuConsultaDePresupuestosySolicitudesClick
        end
        object mnuSolicitudDePresupuestosAMP: TMenuItem
          Caption = 'Solicitud de presupuestos AMP'
          OnClick = mnuSolicitudDePresupuestosAMPClick
        end
        object N18: TMenuItem
          Caption = '-'
        end
        object mnuConfAgendaDeLosMediosDeTransporte: TMenuItem
          Caption = 'Configuraci'#243'n agenda de medios de transporte'
          OnClick = mnuConfAgendaDeLosMediosDeTransporteClick
        end
        object mnuMediosdeTransporte: TMenuItem
          Caption = 'Medios de transporte'
          OnClick = mnuMediosdeTransporteClick
        end
        object mnuN22: TMenuItem
          Caption = '-'
        end
        object mnuPrestadorPreferencial: TMenuItem
          Caption = 'Prestadores preferenciales por Empresa'
          OnClick = mnuPrestadorPreferencialClick
        end
        object N10: TMenuItem
          Caption = '-'
        end
        object mnuMantEspecialidades: TMenuItem
          Caption = 'Especialidades'
          OnClick = mnuMantEspecialidadesClick
        end
        object mnuMantProtesisOrtesis: TMenuItem
          Caption = 'Pr'#243'tesis y '#211'rtesis'
          OnClick = mnuMantProtesisOrtesisClick
        end
        object mnuMantTipoPrestador: TMenuItem
          Caption = 'Tipo de prestador'
          OnClick = mnuMantTipoPrestadorClick
        end
        object mnuManPracticasModulos: TMenuItem
          Caption = 'Pr'#225'cticas m'#243'dulos'
          OnClick = mnuManPracticasModulosClick
        end
        object mnuCompaniasAseguradoras: TMenuItem
          Caption = 'Compa'#241#237'as aseguradoras'
          OnClick = mnuCompaniasAseguradorasClick
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object mnuManPrestUnMedicas: TMenuItem
          Caption = 'Unidades m'#233'dicas'
          OnClick = mnuManPrestUnMedicasClick
        end
        object mnuManNomenclador: TMenuItem
          Caption = 'Nomenclador'
          object mnuNomencladorCargaManual: TMenuItem
            Caption = 'Carga manual'
            OnClick = mnuNomencladorCargaManualClick
          end
          object mnuNomencladorCargaMasiva: TMenuItem
            Caption = 'Carga masiva'
            Hint = 'NOMEN'
            OnClick = ImpoExpo
          end
        end
        object N13: TMenuItem
          Caption = '-'
        end
        object mnuScoring: TMenuItem
          Caption = 'Scoring'
          OnClick = mnuScoringClick
        end
        object mnuUsuariosPrestador: TMenuItem
          Caption = 'Usuarios por prestador'
          OnClick = mnuUsuariosPrestadorClick
        end
        object mnuMotivosBajaPrest: TMenuItem
          Caption = 'Motivos de baja'
          OnClick = mnuMotivosBajaPrestClick
        end
        object mnuIIBBProvincias: TMenuItem
          Caption = 'Ingresos Brutos'
          OnClick = mnuIIBBProvinciasClick
        end
        object mnuEnvioMailTipoPres: TMenuItem
          Caption = 'Env'#237'o de mails por tipo de prestador'
          OnClick = mnuEnvioMailTipoPresClick
        end
      end
      object mnuManRangos: TMenuItem
        Caption = 'Rangos de aprobaci'#243'n o autorizaci'#243'n'
        OnClick = mnuManRangosClick
      end
      object mnuMantSolicitantes: TMenuItem
        Caption = 'Solicitantes'
        OnClick = mnuMantSolicitantesClick
      end
      object mnuMantSubPrestaciones: TMenuItem
        Caption = 'Subprestaciones'
        OnClick = mnuMantSubPrestacionesClick
      end
      object mnuMantTiposTraslado: TMenuItem
        Caption = 'Tipos de traslado'
        OnClick = mnuMantTiposTrasladoClick
      end
      object mnuMantEmpresasVIP: TMenuItem
        Caption = 'Empresas VIP'
        OnClick = mnuMantEmpresasVIPClick
      end
      object mnuMantCie10: TMenuItem
        Caption = 'Diagn'#243'stico CIE-10'
        OnClick = mnuMantCie10Click
      end
      object MnuManTurnosMedicos: TMenuItem
        Caption = 'Turnos m'#233'dicos'
        OnClick = MnuManTurnosMedicosClick
      end
      object MnuMotivosdenoCarga: TMenuItem
        Caption = 'Motivos de no carga'
        OnClick = MnuMotivosdenoCargaClick
      end
      object mnuManAutorizaciones: TMenuItem
        Caption = 'Autorizaciones'
        object MnuMotivosRechazo: TMenuItem
          Caption = 'Motivos de rechazo de autorizaciones'
          OnClick = MnuMotivosRechazoClick
        end
        object MnuMotivosAnulacion: TMenuItem
          Caption = 'Motivos de anulaci'#243'n de autorizaciones'
          OnClick = MnuMotivosAnulacionClick
        end
        object MnuMotAnulTraslados: TMenuItem
          Caption = 'Motivos de anulaci'#243'n de traslados'
          OnClick = MnuMotAnulTrasladosClick
        end
        object mnuManGruposPrestaciones: TMenuItem
          Caption = 'Grupos de prestaciones'
          OnClick = mnuManGruposPrestacionesClick
        end
        object mnuPrestPorPresup: TMenuItem
          Caption = 'Prestadores para envio de presupuestos'
          OnClick = mnuPrestPorPresupClick
        end
      end
      object mnuManMotAnulCitaciones: TMenuItem
        Caption = 'Motivos de anulaci'#243'n de citaciones'
        OnClick = mnuManMotAnulCitacionesClick
      end
      object mnuManCuentasUsuarios: TMenuItem
        Caption = 'Cuentas de usuarios'
        OnClick = mnuManCuentasUsuariosClick
      end
      object mnuRecalificacion: TMenuItem
        Caption = 'Recalificaci'#243'n'
        object mnuLugarCitacion: TMenuItem
          Caption = 'Lugar de citaci'#243'n'
          OnClick = mnuLugarCitacionClick
        end
        object mnuResponsable: TMenuItem
          Caption = 'Responsable'
          OnClick = mnuResponsableClick
        end
      end
      object mnuManPresupuestoMensual: TMenuItem
        Caption = 'Presupuesto mensual'
        OnClick = mnuManPresupuestoMensualClick
      end
      object mnuManLiquidaciones: TMenuItem
        Caption = 'Liquidaciones'
        object mnuManAuditoresVolantes: TMenuItem
          Caption = 'Auditores de volantes'
          OnClick = mnuManAuditoresVolantesClick
        end
        object mnuDerivacionVolantes: TMenuItem
          Caption = 'Derivaci'#243'n de volantes'
          OnClick = mnuDerivacionVolantesClick
        end
        object MnuMotivosDebito: TMenuItem
          Caption = 'Motivos de d'#233'bito'
          OnClick = MnuMotivosDebitoClick
        end
        object mnuManMotivosDebitosAudit: TMenuItem
          Caption = 'Motivos de d'#233'bito auditor'#237'a'
          OnClick = mnuManMotivosDebitosAuditClick
        end
        object mnuManUsuAvisoVol: TMenuItem
          Caption = 'Usuarios aviso de volantes no recepc.'
          OnClick = mnuManUsuAvisoVolClick
        end
      end
      object mnuManTipoDevolFacturas: TMenuItem
        Caption = 'Tipos de factura para devoluci'#243'n'
        OnClick = mnuManTipoDevolFacturasClick
      end
      object mnuManMotivosBajaSeguimientoMed: TMenuItem
        Caption = 'Motivos de baja de seguimientos'
        OnClick = mnuManMotivosBajaSeguimientoMedClick
      end
      object mnuRefDelegaciones: TMenuItem
        Caption = 'Referentes de Delegaciones'
        OnClick = mnuRefDelegacionesClick
      end
      object mnuPrestadoresAuditoria: TMenuItem
        Caption = 'Prestadores que requieren auditor'#237'a'
        OnClick = mnuPrestadoresAuditoriaClick
      end
      object mnuEmpresasPrestadoras: TMenuItem
        Caption = 'Empresas Prestadoras'
        OnClick = mnuEmpresasPrestadorasClick
      end
      object mnuAuditoresPrestador: TMenuItem
        Caption = 'Auditores por Prestador'
        OnClick = mnuAuditoresPrestadorClick
      end
    end
    object mnuGeneral: TMenuItem
      Caption = 'General'
      object mnuDigitalizacion: TMenuItem
        Caption = 'Documentos de Digitalizaci'#243'n'
        OnClick = mnuDigitalizacionClick
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object mnuGIS: TMenuItem
        Caption = 'GIS (Sistema de Informaci'#243'n Geogr'#225'fica)'
        OnClick = mnuGISClick
      end
      object mnuMonitoreoGIS: TMenuItem
        Caption = 'Monitoreo del GIS'
        OnClick = mnuMonitoreoGISClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuAgendaTelefonica: TMenuItem
        Caption = 'Agenda telef'#243'nica'
        OnClick = mnuAgendaTelefonicaClick
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object mnuCorreoElectronico: TMenuItem
        Caption = 'Correo Electr'#243'nico'
        object mnuEnviarCorreo: TMenuItem
          Caption = 'Enviar correo'
          OnClick = mnuEnviarCorreoClick
        end
        object mnuElementosEnviados: TMenuItem
          Caption = 'Elementos enviados'
          OnClick = mnuElementosEnviadosClick
        end
        object mnuLibretaDeDirecciones: TMenuItem
          Caption = 'Libreta de direcciones'
          OnClick = mnuLibretaDeDireccionesClick
        end
      end
      object mnuFax: TMenuItem
        Caption = 'Fax'
        object mnuBandejadeEntrada: TMenuItem
          Caption = 'Bandeja de entrada'
          OnClick = mnuBandejadeEntradaClick
        end
        object mnuElementosEnviadosFax: TMenuItem
          Caption = 'Elementos enviados'
          OnClick = mnuElementosEnviadosFaxClick
        end
      end
      object mnuClasificaciondeActivos: TMenuItem
        Caption = 'Clasificaci'#243'n de activos'
        object mnuClasificacionAct: TMenuItem
          Caption = 'Clasificaci'#243'n'
          OnClick = mnuClasificacionActClick
        end
        object N9900: TMenuItem
          Caption = '-'
        end
        object mnuPlazosdeGuarda: TMenuItem
          Caption = 'Plazos de guarda'
          OnClick = mnuPlazosdeGuardaClick
        end
        object mnuTiposDeActivo: TMenuItem
          Caption = 'Tipos de activo'
          OnClick = mnuTiposDeActivoClick
        end
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object mnuSRT: TMenuItem
        Caption = 'SRT'
        object mnuEnviosSRT: TMenuItem
          Caption = 'Env'#237'os'
          OnClick = mnuEnviosSRTClick
        end
        object mnuVentanillaElectronica: TMenuItem
          Caption = 'Ventanilla electr'#243'nica'
          OnClick = mnuVentanillaElectronicaClick
        end
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object mnuImpresora: TMenuItem
        Caption = 'Impresora'
        GroupIndex = 250
        object mnuImpresoraConfigurar: TMenuItem
          Caption = 'Configurar'
          OnClick = mnuImpresoraConfigurarClick
        end
      end
      object N15: TMenuItem
        Caption = '-'
        GroupIndex = 250
      end
      object mnuNovedadesDelSistema: TMenuItem
        Caption = 'Novedades del sistema'
        GroupIndex = 250
        OnClick = mnuNovedadesDelSistemaClick
      end
    end
    object mnuVentana: TMenuItem
      Caption = '&Ventana'
      GroupIndex = 250
      object mnuMaximizar: TMenuItem
        Caption = 'Maximizar'
        OnClick = mnuMaximizarClick
      end
      object mnuRestaurar: TMenuItem
        Caption = 'Restaurar'
        OnClick = mnuRestaurarClick
      end
      object mnuMinimizar: TMenuItem
        Caption = 'Minimizar'
        OnClick = mnuMinimizarClick
      end
      object sep1: TMenuItem
        Caption = '-'
      end
      object mnuCascada: TMenuItem
        Caption = 'Cascada'
        ImageIndex = 1
        OnClick = mnuCascadaClick
      end
      object mnuMosaicoHorizontal: TMenuItem
        Caption = 'Mosaico Horizontal'
        ImageIndex = 2
        OnClick = mnuMosaicoHorizontalClick
      end
      object mnuMosaicoVertical: TMenuItem
        Caption = 'Mosaico Vertical'
        ImageIndex = 3
        OnClick = mnuMosaicoVerticalClick
      end
      object mnuOrganizarIconos: TMenuItem
        Caption = 'Organizar Iconos'
        OnClick = mnuOrganizarIconosClick
      end
    end
    object mnuSalir: TMenuItem
      Caption = '&Salir'
      GroupIndex = 250
      OnClick = mnuSalirClick
    end
  end
  object ilImagenes: TImageList
    Left = 84
    Top = 4
    Bitmap = {
      494C01010A000E00280010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FFFFFF00FF000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF000000FF000000FF00
      0000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400848484000000000000000000C6C6C60084848400848484000000
      000000000000000000000000000000000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FFFFFF00FF000000FF000000FFFFFF00FF000000FF00
      0000FFFFFF00FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400C6C6C600FFFFFF00C6C6C60084848400848484000000
      000000000000000000000000000000000000FF000000FF000000FFFFFF00FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400C6C6C600FFFFFF00C6C6C60084848400848484000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400C6C6C600FFFFFF00C6C6C60084848400848484000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400C6C6C600FFFFFF00C6C6C60084848400000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600FFFFFF00C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600FFFFFF00C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730073737300737373007373
      7300737373007373730073737300737373007373730073737300737373007373
      7300737373007373730073737300737373007373730073737300737373007373
      7300737373007373730073737300737373007373730073737300737373007373
      7300737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009C00000000000000000000000000000000
      00000000000000000000000000000000000073737300CECECE00CECECE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F700F7F7F700F7F7F700F7F7F7007373730073737300CECECE00CECECE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7
      F7000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000FF3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000009C0000009C00000000000000000000000000000000
      00000000000000000000000000000000000073737300CECECE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7007373730073737300CECECE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F7000000
      0000316363009CCECE00C6D6EF00000000000000000000000000000000000000
      0000FF313100FF313100FF313100FF313100FF313100FF313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C0000009C0000009C00000000000000000000000000000000
      00000000000000000000000000000000000073737300CECECE00FF636300FF63
      6300FF636300FF636300FF636300EFEFEF00FF636300FF636300F7F7F700FF63
      6300FF636300FF636300F7F7F7007373730073737300CECECE00FF636300FF63
      6300FF636300FF636300FF636300EFEFEF00FF636300FF636300000000003163
      6300639CCE00C6D6EF000000000073737300000000000000000000000000FF31
      3100FF313100FFCECE00FFCECE00FF313100FFCECE00FF313100FF3131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009C0000009C000000840000009C0000009C000000000000000000000000
      00000000000000000000000000000000000073737300DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7007373730073737300DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF000000000031636300639C
      CE00C6D6EF0000000000F7F7F70073737300000000000000000000000000FF31
      3100FF3131000000000000000000FF31310000000000FFCECE00FF313100FF31
      310000000000000000000000000000000000000000000000000000000000009C
      0000009C0000008400000000000000840000009C000000000000000000000000
      00000000000000000000000000000000000073737300DEDEDE00FF636300FF63
      6300FF636300FF636300FF636300EFEFEF00FF636300FF636300F7F7F700FF63
      6300FF636300FF636300FFFFFF007373730073737300DEDEDE00FF636300FF63
      6300FF636300FF636300FF636300EFEFEF000000000031636300639CCE009CCE
      CE0000000000FF636300FFFFFF0073737300000000000000000000000000FFCE
      CE00FFCECE000000000000000000FF3131000000000000000000FF313100FF31
      3100000000000000000000000000000000000000000000000000009C0000009C
      000000840000000000000000000000840000009C0000009C0000000000000000
      00000000000000000000000000000000000073737300DEDEDE00DEDEDE00DEDE
      DE00EFEFEF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00FFFFFF007373730073737300DEDEDE00DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000F7F7F700FFFFFF00FFFFFF00737373000000000000000000000000000000
      0000000000000000000000000000FF3131000000000000000000FF313100FF31
      3100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000840000009C0000000000000000
      00000000000000000000000000000000000073737300DEDEDE00FF636300FF63
      6300FF636300FF636300FF636300F7F7F700FF636300FF636300F7F7F700FF63
      6300FF636300FF636300FFFFFF007373730073737300DEDEDE0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FF636300FF636300FFFFFF00737373000000000000000000000000000000
      0000FF313100FF313100FF313100FF313100FF313100FF313100FF313100FFCE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000009C00000000
      00000000000000000000000000000000000073737300DEDEDE00DEDEDE00EFEF
      EF00EFEFEF00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00737373007373730000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0073737300000000000000000000000000FF31
      3100FF313100FFCECE00FFCECE00FF313100FFCECE00FFCECE00FFCECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000009C0000009C
      00000000000000000000000000000000000073737300DEDEDE00840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000FFFFFF007373730000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000840000008400
      00008400000084000000FFFFFF0073737300000000000000000000000000FF31
      3100FF3131000000000000000000FF3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000840000009C
      00000000000000000000000000000000000073737300EFEFEF00EFEFEF00EFEF
      EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007373730000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0073737300000000000000000000000000FF31
      3100FF3131000000000000000000FF3131000000000000000000FF313100FF31
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      0000009C000000000000000000000000000073737300EFEFEF00FF313100FF31
      3100FF313100F7F7F700840000008400000084000000FFFFFF00FF313100FF31
      3100FF313100FF313100FFFFFF008484840000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FF313100FF31
      3100FF313100FF313100FFFFFF0084848400000000000000000000000000FFCE
      CE00FF313100FF31310000000000FF3131000000000000000000FF313100FF31
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000840000009C0000000000000000000073737300EFEFEF00EFEFEF00F7F7
      F700F7F7F700F7F7F70084000000FFFFFF0084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000FFCECE00FF313100FF313100FF313100FF313100FF313100FF313100FFCE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000840000009C00000000000073737300EFEFEF00FF313100FF31
      3100FF313100F7F7F700840000008400000084000000FFFFFF00FFFFFF00FFFF
      FF00FF313100FF313100FFFFFF00848484007373730000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000FFFFFF00FFFFFF00FFFF
      FF00FF313100FF313100FFFFFF00848484000000000000000000000000000000
      000000000000FFCECE00FFCECE00FF313100FFCECE00FFCECE00FFCECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000008400000000000073737300F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840073737300F7F7F70000000000CECE
      3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000FF3131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008400007373730073737300737373008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484007373730073737300737373000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000FFCECE000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      1800000000000000000000000000000000002121210021212100212121002121
      2100212121002121210021212100212121002121210021212100212121002121
      2100212121002121210021212100000000001818180018181800181818001818
      1800181818001818180018181800181818001818180018181800181818001818
      180018181800181818001818180000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF6331008400000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6001818
      18000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600212121000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6001818180000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF6331008400000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6001818
      18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60018181800000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6001818
      18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60018181800000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6001818
      18000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60018181800000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6001818
      1800181818001818180018181800181818008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60018181800000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6001818
      1800C6C6C600C6C6C600C6C6C60018181800FF000000FF9C3100FF633100FF63
      3100FF633100FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF633100212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60018181800000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000001818
      1800FFFFFF00FFFFFF00C6C6C60018181800FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60018181800000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000FF000000FF9C3100FF633100FF63
      3100FF633100FF633100FF633100FF633100FF633100FF633100FF6331001818
      1800FFFFFF00FFFFFF00C6C6C6001818180084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6001818180000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000001818
      1800FFFFFF00FFFFFF00C6C6C6001818180084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60018181800000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6001818180084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60018181800000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6001818180084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600212121000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60018181800000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000181818008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000021212100000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000018181800000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF9C3100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF633100FF63310018181800FF000000FF9C3100FF633100FF63
      3100FF633100FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF6331002121210000000000FF000000FF9C3100FF633100FF63
      3100FF633100FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF63310018181800000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C00000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000018181800FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF0000002121210000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF0000001818180000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFB000000000000
      BFF7000000000000DFE7000000000000C30F000000000000E00F000000000000
      E01F000000000000F01F000000000000F03F000000000000F83F000000000000
      F87F000000000000FC7F000000000000FC7F000000000000FCFF000000000000
      FEFF000000000000FFFF000000000000FFFF00000000FEFFFEFF00000000FEFF
      FCFF00000000F03FF8FF00000000E01FF07F00000000E68FE27F00000000E6CF
      C63F00000000FECFFF3F00000000F00FFF9F00000000E01FFF8F00000000E6FF
      FFCF00000000E6CFFFE700000000E2CFFFF300000000F00FFFF900000000F81F
      FFFD00000000FEFFFFFE00000000FEFF0000FFFFFFFFFFFF0000000F00010001
      0000000F000100010000000F00010001F807000F00010001F807000F00010001
      E807000000010001E007000000010001E0070000000100010007000000010001
      00070000000100010007F00000010001E007F00000010001E007F00000010001
      F807F00000010001F807F0000001000100000000000000000000000000000000
      000000000000}
  end
  object DBLogin: TDBLogin
    DataBaseName = dmPrincipal.sdbPrincipal
    OnLogin = DBLoginLogin
    UseNetworkUser = True
    CheckServerDate = True
    AutoEjecutar = True
    Shake = False
    Top = 4
  end
  object Seguridad: TSeguridad
    AutoEjecutar = True
    Claves = <
      item
        Name = 'PermisoParaModificarCalles'
      end
      item
        Name = 'PermisoParaModificarCallesProvincia'
      end
      item
        Name = 'VerMenuAbandonoTratamiento_Nuevo'
      end>
    DBLogin = DBLogin
    PermitirEdicion = True
    Left = 28
    Top = 4
  end
  object FormPlacement: TFormPlacement
    UseRegistry = True
    Left = 56
    Top = 4
  end
  object imgGenColor: TImageList
    Left = 84
    Top = 32
    Bitmap = {
      494C010132003600280010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      000000000000000000000000000000000000000000003131CE003131CE000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE003131CE000063
      FF000000FF0000009C0000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003131CE00319C
      FF000063FF000000CE0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD0000848400000000000000FF000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000212121003131
      CE00319CFF000000FF0000009C00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD000000FF0000009C000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE000000CE000063FF0000009C00FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE000000FF0000009C00000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C6009C313100C6C6C6009C313100C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE000000CE000000FF0000009C008484000084840000FFFFFF00F7F7
      F7000000FF0000009C0000848400000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF008400000084000000840000009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00E7E7E7000000CE000000FF0000009C00FFFFFF00FFFFFF000000
      FF0000009C009CCECE0000848400000000000000000084848400F7F7F700C6C6
      C600C6C6C600840000009C633100C6C6C6009C63310084000000C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E700848400000000CE000000FF0000009C000000FF000000
      9C009CCECE0094ADAD004A4A4A00000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF009C6331009CFFFF009C63310084000000C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400000000CE000000FF0000009C00D6D6
      D60094ADAD00009C9C0010101000000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C600840000008400000084000000C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD000000CE000000FF0000009C000000CE000000
      9C0094ADAD004242420000000000000000000000000084848400F7F7F7009CFF
      FF00C6C6C600840000009C6331009CFFFF009C6331009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000021212100009C9C000000CE000000FF0000009C00639C9C00639C9C000000
      CE0000009C000000000000000000000000000000000084848400F7F7F700C6C6
      C600C6C6C600840000009C633100C6C6C6009C63310084000000C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000CE000000FF0000009C000084840000848400313131000000
      00000000CE0000009C0000000000000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF008400000084000000840000009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000000
      CE00319CFF000000FF0000009C00009C9C0094ADAD00009C9C004A4A4A000000
      0000000000000000CE0000009C00000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C6009C313100C6C6C6009C313100C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000FF0000009C0000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      100000000000000000000000CE0000009C000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C00009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063639C000000CE000000CE006363
      9C0000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      000000000000C6C6C60000000000FF00000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C3100009C31000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000C6C6C600B5B5B500A5A5A50000000000000084000000FF000000CE000000
      9C000000840000000000C6C6C600C6C6C6008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000CE310000CE31000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C60084848400C6C6
      C600B5B5B500A5A5A50000000000000000000000840000008400C6C6C6000000
      9C000000840000000000C6C6C600C6C6C60084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000CE630000CE63000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      0000C6C6C60000000000000000000000000000008400C6C6C600B5B5B500A5A5
      A50000000000C6C6C600C6C6C600C6C6C60084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000FF633100FF63310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000B5B5B500A5A5A5000000
      000000000000C6C6C600C6C6C600C6C6C60084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000FF9C3100FF9C310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000A5A5A500000000000000
      000000000000C6C6C600C6C6C600C6C6C60084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000FFCE3100FFCE
      9C00FFCE6300FF9C6300FF9C6300FF9C3100FF9C3100FF9C3100FF630000CE63
      0000CE3100009C31000000000000000000000000000000000000FFCE3100FFCE
      9C00FFCE6300FF9C6300FF9C6300FF9C3100FF9C3100FF9C3100FF630000CE63
      0000CE3100009C31000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600CECECE00CECECE00C6C6C60000000000D6D6D600D6D6
      D600C6C6C60000000000C6C6C600C6C6C60084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000FFCE3100FFCE
      9C00FFCE6300FF9C6300FF9C6300FF9C3100FF9C3100FF9C3100FF630000CE63
      0000CE3100009C31000000000000000000000000000000000000FFCE3100FFCE
      9C00FFCE6300FF9C6300FF9C6300FF9C3100FF9C3100FF9C3100FF630000CE63
      0000CE3100009C31000000000000000000000000000000000000000000000000
      000000000000D6D6D600D6D6D600FF00000000000000D6D6D600D6D6D600D6D6
      D600C6C6C60000000000C6C6C600C6C6C60084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000FF9C6300FF9C630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600D6D6D600D6D6D60000000000C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60000000000C6C6C60084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000FF9C6300FF9C630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000D6D6D600D6D6
      D600FF00000000000000C6C6C600C6C6C60084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C6000000FF000000840000008400000084000000FF00C6C6
      C600C6C6C600C6C6C600FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000FFCE6300FFCE630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600D6D6
      D600D6D6D60000000000C6C6C600C6C6C60084848400FFFFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000FFCE9C00FFCE9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000C6C6C6008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000FFCE3100FFCE310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C60084848400C6C6C60084848400C6C6
      C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6C60084848400C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE0000009C000000FF000000CE0000009C00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      000000000000000000009C0000009C0000007300000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000063000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000009C00319CFF000000CE009CFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000000000000000000000000
      00009C0000009C3100009C3100000063CE009C0000009C000000730000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000FF00FFFFFF00000063000000
      0000FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE3100000000CE000000CE00CE310000CE3100000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000000000009C00
      00009C0000009C31000000CE3100319CCE000063CE00319CFF00730000007300
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000000000000000FF00FFFFFF000000630000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE000000000000000000000000009C000000CE31
      0000CE310000CE31000000CE310000CE31009C3100009C3100009C0000009C00
      00007300000000000000000000000000000000000000FFFFFF00000000004263
      6300000000004263630042636300000000000000630000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF000000
      CE0000009C000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000000000000CE310000CE31
      000000CE310000AD000000CE3100319CCE000063CE00CE310000CE0000009C00
      00009C0000000000000000000000000000000000000000000000426363000000
      0000FFFF000042636300FFFFFF004263630000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000000CE0000009C00000000000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE00000000000000000000000000CE310000CE63
      000063CEFF00319CCE0063CEFF0063CEFF00319CFF00CE310000CE310000CE00
      00009C000000000000000000000000000000000000000000000000000000FFFF
      0000000000004263630000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE000000CE0000009C0000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE00000000000000000000000000CE310000FF63
      0000319CCE00319CCE00319CCE0000AD0000319CFF00CE63000000CECE000063
      CE0000639C000000000000000000000000000000000000000000FFFF0000FFFF
      FF00FFFF000042636300FFFF00000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000CE0000009C000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE0000000000000000000000000000000000CE630000CE63
      000000CECE0000CECE0000FF000000CECE0063CEFF0000CECE0063CEFF0063CE
      FF009C000000000000000000000000000000000000000000000042636300FFFF
      FF00FFFFFF004263630000000000426363000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE0000000000000000000000CE0000009C000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000000000000CE310000CE63
      000000CE310000CE3100CEFFCE0000FF000000FF000000AD000063CEFF0063CE
      FF0000639C0000000000000000000000000000000000FFFFFF00000000004263
      6300FFFF0000426363004263630000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      00000000000000000000000000000000CE0000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE63
      0000CE630000FF63000000CE310000CE3100CEFFCE0000AD0000CEFFCE0000AD
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE630000CE630000CEFFCE00CE310000CE3100009C31000000CE31000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CE310000CE310000CE31000000000000000000000000
      0000000000000000000000000000000000004200000042000000420000004200
      0000420000004200000042000000420000004200000042000000420000004200
      0000420000004200000042000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004200000042000000420000004200
      0000420000004200000042000000420000004200000042000000420000004200
      0000420000004200000042000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004200000042000000420000004200
      0000420000004200000042000000420000004200000042000000420000004200
      0000420000004200000042000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000009C000000FF0000009C00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000848400005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A00848400000000000000000000000000000000
      0000000000000000000000009C00319CFF000063FF000000FF0000009C000000
      00000000000000000000000000000000000000000000FFCECE00FFFFFF008484
      8400848484008484840000000000000000000000000000000000000000003163
      9C0031639C0031639C0000000000FF00000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000004A4A4A009C9C9C00EFEFEF00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      C600C6C6C600B5B5B5009C9C9C004A4A4A000000000000000000000000000000
      000000000000000000000000000000009C00319CFF0000009C00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000094ADAD0094ADAD0094ADAD00319C
      9C00319C9C0094ADAD0000000000FF31310084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00000000004A4A4A00EFEFEF009C9C9C00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C6009C9C9C00B5B5B5004A4A4A000000000000000000000000000000
      00000000000000000000000000000000000000009C0000000000000000000000
      00000000000000000000000000000000000000000000FFCECE00FFFFFF008484
      840084848400848484000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF63630084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000004A4A4A00EFEFEF00EFEFEF009C9C
      9C00E7E7E700D6D6D600C6C6C600949494009C9C9C00DEDEDE00DEDEDE00D6D6
      D6009C9C9C00D6D6D600B5B5B5004A4A4A000000000000000000000000000000
      00000000000000000000000000000000000000009C0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFCECE0000FFFF0000000000FFCECE00FFCE
      CE000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF00000000004A4A4A00EFEFEF00EFEFEF00E7E7
      E7009C9C9C00C6C6C60094949400D6D6D600D6D6D60094949400DEDEDE009C9C
      9C00D6D6D600D6D6D600B5B5B5004A4A4A000000000000000000000000000000
      000000000000000000000000000000009C000000FF0000009C00000000000000
      00000000000000000000000000000000000000000000FFCECE00FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE0000000000FFCECE0000FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00000000004A4A4A00E7E7E700EFEFEF00D6D6
      D600C6C6C60094949400DEDEDE00DEDEDE00DEDEDE00DEDEDE0094949400DEDE
      DE00CECECE00D6D6D600B5B5B5004A4A4A000000000000000000000000000000
      000000000000000000000000000000009C000000FF0000009C00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000004A4A4A00E7E7E700DEDEDE00C6C6
      C60094949400E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE009494
      9400D6D6D600DEDEDE00B5B5B5004A4A4A000000000000000000000000000000
      0000000000000000000000009C000063FF000000FF000000FF0000009C000000
      00000000000000000000000000000000000000000000FFCECE00FFFFFF008484
      8400848484008484840084848400848484008484840084848400FFFFFF0000FF
      FF0000000000FFFFFF00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF00000000004A4A4A00E7E7E700D6D6D6009494
      9400EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E70094949400D6D6D600C6C6C6004A4A4A000000000000000000000000000000
      0000000000000000000000009C000063FF000000FF000000FF0000009C000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF0000000000FFFFFF00000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000004A4A4A00DEDEDE0094949400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF0094949400B5B5B5004A4A4A000000000000000000000000000000
      0000000000000000000000009C00319CFF000000FF000000FF0000009C000000
      00000000000000000000000000000000000000000000FFCECE00FFFFFF008484
      8400848484008484840084848400848484008484840084848400FFFFFF00FFCE
      CE000000000000FFFF00FFFFFF000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      8400848484008484840084848400000000004A4A4A0094949400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700949494004A4A4A000000000000000000000000000000
      0000000000000000000000009C00319CFF000063FF000000FF0000009C000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFCECE00FFCECE000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C60000000000848400004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00848400000000000000000000000000000000
      0000000000000000000000009C00319CFF00319CFF000063FF0000009C000000
      0000000000000000000000000000000000000000000000000000FFCECE00FFCE
      CE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE0000000000FFFFFF00FFFFFF000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000009C0000009C0000009C00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000639CFF003163FF000063FF000063FF000031FF000031FF003131
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000006363CE003131CE000000DE000000BD0000007300000063003131
      6300000000000000000000000000000000000000000000000000000000003131
      3100008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400000000009CFFFF003163FF000063
      FF000063FF003163FF00319CFF009CCEFF000063FF000031FF00319CFF003163
      FF000063FF000031FF003163FF0000000000000000009C9CFF003131CE000000
      DE000000FF003131FF00639CFF009CCEFF000000DE0000008C003163FF003131
      CE0000008C000000630031319C00000000000000000000000000000000004A4A
      4A0094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD000084840000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000084000000000084848400000000000063FF00319CFF00319C
      FF00319CFF000063FF000063FF00639CFF000063FF000031FF00639CFF00319C
      FF003163FF00639CFF000031FF0000000000000000000000DE003163FF009C9C
      FF009C9CFF00CEFFFF00CEFFFF00CEFFFF000000FF0000008C00639CFF000031
      9C006363FF00639CFF0000009C000000000000000000000000002121210094AD
      AD009CCECE00E7E7E700EFEFEF00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD0021212100000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000840000000000000084000000FF000000FF000000
      FF000000FF00000084000000000084848400000000000063FF000063FF000063
      FF000063FF0063CEFF00639CFF00639CFF000063FF000031FF00639CFF000031
      FF000063FF000031FF003163CE0000000000000000000031CE000000FF000000
      FF006363FF00CEFFFF00CEFFFF00CEFFFF000000FF0000008C00639CFF000031
      9C003163CE00639CFF003163FF00000000000000000000000000008484009CCE
      CE009CCECE00F7F7F70084840000FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE009CCECE000084840000000000000000000000FF000000FF000000
      FF000000FF000000FF000000840000000000000084000000FF000000FF000000
      FF000000FF00000000008484840000000000000000003163FF00CEFFFF000063
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF000063FF000031FF000031FF000031
      FF003163FF003163FF00319CFF0000000000000000000031CE00CEFFFF000000
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF000000FF0000008C00639CFF000031
      9C003163CE00639CFF00319CFF00000000000000000000000000008484009CCE
      CE009CCECE00F7FFFF00EFEFEF00FFFFFF008484000084840000FFFFFF00F7F7
      F7009CCECE009CCECE000084840000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084000000FF000000FF000000FF000000
      FF0000008400000000008484840000000000000000003163FF00CEFFFF000063
      FF000063FF000063FF00CEFFFF00CEFFFF000063FF000031FF000063FF000031
      FF003163FF000031FF00639CFF0000000000000000003131CE00CEFFFF000000
      FF003131FF000000FF00CEFFFF00CEFFFF000000FF0000008C00639CFF000000
      730031319C00639CFF00319CFF00000000000000000000000000008484009CCE
      CE009CCECE00E7E7E700FFFFFF008484000084840000FFFFFF00FFFFFF00EFEF
      EF009CCECE009CCECE00008484000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000FF000000FF000000FF000000
      FF0000000000848484000000000000000000000000003163FF00CEFFFF000063
      FF00319CFF00319CFF00CEFFFF009CFFFF000063FF000031FF00639CFF000031
      FF000063FF000031FF00319CFF0000000000000000003131CE00CEFFFF000000
      FF009C9CFF003131FF00CEFFFF009CCEFF000000FF0000008C00639CFF000031
      9C0000319C00639CFF00319CFF000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E70084840000FFFFFF0084840000FFFFFF0084840000E7E7
      E7009CCECE0094ADAD004A4A4A000000000000000000000000000000FF000000
      FF000000FF000000FF000000840000000000000084000000FF000000FF000000
      840000000000848484000000000000000000000000003163FF00CEFFFF000063
      FF00CEFFFF009CCEFF00009CFF00639CFF000063FF000031FF00639CFF00639C
      FF000031FF00319CFF00319CFF0000000000000000003131CE00CEFFFF000000
      FF00CEFFFF009CCEFF003131FF006363FF000000FF0000008C00639CFF000031
      9C0031319C0000007300319CFF00000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400008484000084840000EFEFEF00D6D6
      D60094ADAD00009C9C0010101000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000FF000000FF000000
      000084848400000000000000000000000000000000003163FF000063FF000063
      FF000063FF000063FF00319CFF00639CFF000063FF000031FF00639CFF00639C
      FF00639CFF00639CFF003163FF0000000000000000003131CE003131FF000000
      FF000000FF000000FF003131FF00639CFF000000FF0000008C00639CFF00639C
      FF000000730000007300639CFF00000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E700D6D6D60094AD
      AD0094ADAD004242420000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000FF00000084000000
      000084848400000000000000000000000000000000000063FF009CCEFF009CCE
      FF00639CFF003163FF00009CFF0000CEFF0000CEFF00009CFF000063FF000031
      FF003163FF00639CFF003163CE0000000000000000000031CE009CCEFF009CCE
      FF006363FF003131FF000000FF003131FF003131FF000000CE0000008C000000
      9C003163CE00639CFF003163CE00000000000000000000000000000000000000
      000021212100009C9C00639C9C00639C9C00639C9C00639C9C00639C9C00009C
      9C00212121000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000000000000000000000FF00000000008484
      840000000000000000000000000000000000000000000063FF00009CFF0000CE
      FF0000CEFF00009CFF003163FF00639CFF0063CEFF0063CEFF00639CFF000063
      FF00009CFF000063FF000031FF0000000000000000000000FF000000FF003131
      FF000000FF000000BD003131CE006363CE009C9CFF00639CFF006363CE000000
      9C000000AD0000009C0000007300000000000000000000000000000000000000
      0000000000000000000031313100009C9C000084840000848400313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000008400000000000000840000008400000000008484
      84000000000000000000000000000000000000000000009CFF000063FF00639C
      FF009CCEFF0063CEFF00009CFF000063FF000063FF000063FF000063FF00319C
      FF009CCEFF00639CFF00009CFF0000000000000000000000DE000031CE006363
      CE009CCEFF00639CFF000000DE000000CE000000CE000000CE000000BD003163
      FF009CCEFF006363CE0000009C00000000000000000000000000000000000000
      000000000000000000004A4A4A00009C9C0094ADAD00009C9C004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000063
      FF003163FF0063CEFF000063FF00319CFF00319CFF000063FF0063CEFF00319C
      FF003163FF000063FF0000000000000000000000000000000000000000000000
      AD003163CE009CCEFF000000CE003163FF003131FF000000CE009C9CFF003163
      CE003131CE0000009C0000000000000000000000000000000000000000000000
      0000000000001010100000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000840000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063FF003163FF000063FF000063FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000009C003163CE0000319C0000009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000BD000000CE000000DE000000BD000000730000008C000000
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000009C000000CE000000CE0000009C00000052000000520000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000319C310000730000008C00000063000000420000003100003163
      3100000000000000000000000000000000000000000000000000000000000000
      00000000000063316300630063009C009C003100310031003100310031003131
      310000000000000000000000000000000000000000003131CE000000CE000000
      FF003131FF003163FF003131FF009C9CFF000000FF0000007300639CFF003163
      CE0000009C0000008C000000730000000000000000009C000000CE0000009C31
      31009C3163009CCEFF00CEFFFF009C639C00CE0000003163CE003163FF006331
      63005200000052000000000000000000000000000000639C6300007300000073
      0000009C0000319C9C00639CCE009CCEFF00008C000000420000319CFF000063
      9C000052000000310000639C630000000000000000009C639C00630063006300
      63009C009C006363FF009C9CFF009C9CFF009C009C00310031003163FF003131
      9C0063006300310031009C639C0000000000000000000000DE003163FF000000
      FF00CEFFFF000000FF003131FF00CEFFFF000000FF0000007300639CFF000000
      9C003131CE003163CE0000008C0000000000CE00000063639C00FF633100CE00
      0000CE000000CE000000FF633100CE9C9C00CE000000639CFF00633131006331
      31005200000031319C00630000000000000000000000008C0000639CCE00319C
      6300008C0000009C00009CFFCE00CEFFFF00009C000000420000639CFF00319C
      9C00319C63003163FF000042000000000000000000009C009C009C9CFF00CECE
      FF00CE63CE00CE9CCE00CEFFFF00CEFFFF009C009C003100630031639C003100
      310063319C003163CE003100310000000000000000006363FF003131FF003163
      FF00CEFFFF006363FF009C9CFF00CEFFFF000000FF00000073003163CE000000
      9C0000009C0000008C000031CE0000000000CE000000CE313100CE000000FF9C
      6300F7FFFF00FF633100CE000000CE9C9C00CE000000639CFF00633131006331
      31009C9C9C0063310000630000000000000000000000319C9C0063CE6300009C
      00009CFFCE0063CE6300009C0000CEFFFF00009C000000420000319C9C000073
      0000319C6300009C310031639C0000000000000000009C9CCE009C009C009C00
      9C00CE319C009C009C00CE31CE00CEFFFF009C009C0031006300310031006363
      CE003100310063639C00313163000000000000000000639CFF00CECEFF000000
      FF009C9CFF000000FF00CEFFFF00CEFFFF000000FF00000073003131CE003131
      CE00639CFF0000008C003163CE0000000000CE000000CEFFFF00CE000000CEFF
      FF00CEFFFF00FF636300CE000000CE9C9C00CE000000639CFF00633131006331
      31009C9C9C0052000000630000000000000000000000639C9C0000AD000031CE
      6300CEFFFF00CEFFCE0031CE3100CEFFFF00009C00000042000000730000319C
      6300639CFF00319C63003163CE0000000000000000009CCEFF009C31CE00CE9C
      FF00CEFFFF00CE63CE009C009C00CEFFFF009C00CE003100630031003100639C
      FF003100310031639C0031319C0000000000000000006363FF00CEFFFF000000
      FF006363FF000000FF00CEFFFF00CEFFFF000000FF00000073003163CE000000
      9C00639CFF0000008C003163CE0000000000CE000000CEFFFF00CE000000CE63
      6300CE000000CE000000DEDEDE00CE9C9C00CE000000639CFF00633131006331
      00005200000063316300630000000000000000000000639C9C00009C000063CE
      6300CEFFFF00CEFFFF00CEFFFF00CEFFFF00009C00000042000000730000319C
      6300639CFF00639CFF003163CE0000000000000000009CCEFF009C31CE00CE9C
      FF00CEFFFF00FFFFFF009C009C00CEFFFF009C009C0031316300633163003100
      31003100310063639C0031319C0000000000000000006363FF00CEFFFF003163
      FF009CCEFF000000FF00CEFFFF00CEFFFF000000FF0000007300639CFF000000
      9C0000008C0000008C003163CE0000000000CE000000CEFFFF00CE000000CE9C
      9C00CEFFFF00CE000000CE636300CE9C9C00CE000000639CFF00633131006363
      CE00639CFF00639CFF00630000000000000000000000639C9C00008C000031CE
      3100CEFFFF009CFF9C00009C0000CEFFFF00009C000000420000319C9C000073
      0000319C6300007300003163CE0000000000000000009CCEFF009C31CE00CE9C
      FF00CEFFFF00CE9CFF009C009C00CEFFFF009C009C0031006300639CFF00639C
      FF0031319C0063639C0031319C000000000000000000639CFF00CEFFFF00CECE
      FF003131FF003131FF00CEFFFF00CEFFFF000000FF0000007300639CFF00639C
      FF00639CFF0000009C003163CE0000000000CE000000CEFFFF00CE000000CEFF
      FF00F7FFFF00CE000000FF636300A5A5A500CE000000639CFF00633131006363
      CE00639CFF00639CFF00630000000000000000000000639C9C0063CE3100009C
      000063CE630000AD0000009C0000CEFFFF00009C000000420000639CFF00639C
      CE00009C3100639CFF003163CE0000000000000000009CCEFF009C31CE00CE9C
      FF00CECEFF009C009C00CE31CE00CEFFFF009C009C0031006300639CFF00639C
      FF0031319C0031639C0031319C0000000000000000006363FF00CEFFFF009C9C
      FF000000FF000000FF009CCEFF003163FF000000FF0000007300639CFF00639C
      FF00639CFF00639CFF003163CE0000000000CE000000FF633100CE000000CE00
      0000CE000000CE6363009CCECE00CE000000CE00000031319C00636363006363
      CE00639CFF00639CFF00630000000000000000000000639C9C00CEFFFF00009C
      0000008C0000009C0000CEFFFF0063CEFF00008C000000420000639CFF00639C
      FF00639CFF00639CFF003163CE0000000000000000009C9CCE009C009C009C00
      9C009C009C009C009C00CEFFFF009C63FF00CE00CE0031003100639CFF00639C
      FF0031319C0063639C0031319C0000000000000000003131FF00CEFFFF00639C
      FF000000FF000000FF000000FF003131FF000000DE000000CE0000008C000000
      73003163CE00639CFF0000319C0000000000CE0000009CCEFF00CECECE009C63
      CE00CE000000CE000000FF000000FF310000CE0000009C000000730000006300
      00006363CE003163CE00630000000000000000000000319C9C00CEFFFF009CFF
      FF00319C6300009C3100009C000000AD000000AD000000730000004200000063
      3100319CFF00639CFF0000319C000000000000000000639CFF00CECEFF00CE9C
      FF009C31CE009C00CE00CE00CE00FF31CE00CE00CE009C009C00310031003131
      63006363CE00639CFF000000630000000000000000000000FF000000FF003131
      FF000000CE003131CE00639CFF009CCEFF003131CE009CCEFF00639CFF003131
      9C000000AD0000008C000000730000000000CE000000CE000000FF310000FF31
      00009C0031009C3131009CCEFF00A5A5A5009C3131009CCECE009C3163009C00
      00009C00000063000000630000000000000000000000008C0000009C000000AD
      0000009C000000730000319C9C00639C9C0063CE6300639CCE00639C9C000063
      000000630000004200000042000000000000000000009C009C00CE00CE00FF31
      CE00CE00CE009C009C006363CE009C9CCE009C319C009C9CCE006363CE006300
      630063006300310031003100310000000000000000000000BD003163CE009C9C
      FF009CCEFF009C9CFF000000CE000000CE000000CE000000CE000000CE009C9C
      FF009CCEFF00639CFF0000009C0000000000FF3100009C0000009C9CCE009CCE
      FF009CCEFF009C6363009C0000009C0000009C0000009C0000009C6331009CCE
      FF009CCEFF0063316300CE0000000000000000000000008C000031636300639C
      CE009CCEFF0063CE63000052000000520000005200000052000000520000639C
      63009CCEFF00639C9C000063000000000000000000009C009C006331CE009C9C
      FF009CCEFF009C63CE0063006300630063006300630063006300630063009C63
      CE009CCEFF006363CE009C006300000000000000000000000000000000000000
      BD000031CE00639CFF000000CE00639CFF003131FF000000CE009C9CFF000031
      CE000000AD000000AD0000000000000000000000000000000000000000009C00
      310063639C009C0000009C633100CE6331009C0000009C3131006363CE009C31
      3100CE0000000000000000000000000000000000000000000000000000000063
      0000319C9C009CCECE0000630000319C630031630000005200009CCEFF003163
      9C00006331000063000000000000000000000000000000000000000000009C00
      63006363CE009C9CCE00630063009C639C009C316300630063009CCEFF006363
      CE0063009C0063009C0000000000000000000000000000000000000000000000
      000000000000000000000000BD000031CE000000AD000000AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C00310063316300CE00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063000031639C000063310000630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000630063006363CE00630063009C009C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000FF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE0000000000000000000000000000000000000000000000CE000063FF000000
      FF0000009C00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF0000009C00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF00CECECE00000000000000FF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE31000000000000000000000000000000000000000000006363
      9C0063639C0063639C0000000000FF00000000000000000000000000CE00319C
      FF000000CE0000009C00CE310000CE310000CE310000CE310000CE3100009CFF
      FF00CECECE000000FF0000009C00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00000000000000000094ADAD0094ADAD0094ADAD00639C
      9C00639C9C0094ADAD0000000000FF3131000000000000000000848484000000
      CE000063FF0000009C009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFF
      FF000000FF0000009C0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF0000000000000000FFFF00000000000000000094ADAD0094AD
      AD0094ADAD0094ADAD0000000000FF636300000000000000000084848400FFFF
      FF000000CE000000FF0000009C00FF000000FF000000FF000000FF0000000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000000000C6C6C60000FFFF0000000000C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000084848400FFFF
      FF009CFFFF000000CE000000FF0000009C009CFFFF00FFFFFF000000FF000000
      9C00CECECE000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF00000000000000C6C6C60000FFFF00000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF000000FF0000000000CE000000FF0000009C000000FF0000009C009CFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000084848400000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00000000000000000000FFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF009CFFFF000000CE000000FF0000009C009CFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000848484000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FF633100FF6331000000CE000000FF0000009C000000CE0000009C00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      000000FFFF00000000000000000000000000000000000000000084848400FFFF
      FF000000CE000000CE000000FF0000009C009CFFFF00FFFFFF000000CE000000
      9C0000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      00000000000000FFFF00000000000000000000000000000000000000CE000000
      CE000063FF000000FF0000009C00FFFFFF00FFFFFF00FFFFFF00848484000000
      CE0000009C000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000008484840000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000CE0000009C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000CE0000009C00000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      CE0000009C008484840084848400848484008484840084848400848484000000
      000000000000000000000000CE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00000000000000000000000000000000000042424200CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600B5B5B500B5B5B500000000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000316363009CCECE00C6D6EF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFCE
      31008400000000000000000000000000000042424200D6D6D600EFEFEF00EFEF
      EF00DEDEDE00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600C6C6C6009C9C9C00000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      6300639CCE00C6D6EF0000000000000000000000000000000000000000000000
      0000000000009C0000008400000084000000840000008400000084000000FFFF
      9C00FFCE3100840000000000000000000000424242005A5A5A00CECECE00DEDE
      DE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600B5B5B5005A5A5A00000000000000000000000000000000008484
      8400FFFFFF00CE310000CE310000CE310000CE310000CE310000CE310000CE31
      00009CFFFF00CECECE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031636300639C
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      00000000000084000000FFCE3100FFCE3100FFFF9C00FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFCE3100840000000000000042424200E7E7E7005A5A5A00C6C6
      C600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00B5B5B5005A5A5A00B5B5B500000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639CCE009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000084000000840000009C0000009C0000009C0000009C000000FFCE
      3100FFCE31009C000000000000000000000042424200E7E7E700DEDEDE005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00E7E7E700C6C6C600000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      31009C00000000000000000000000000000042424200E7E7E7005A5A5A00C6D6
      EF00C6D6EF00C6D6EF00C6C6C600C6C6C600C6C6C600C6D6EF00C6C6C600C6D6
      EF00C6D6EF005A5A5A00C6C6C600000000000000000000000000000000008484
      8400FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE000000000000000000000000000000000000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C0000009C00
      000000000000000000000000000000000000424242005A5A5A0000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6D6EF00C6D6
      EF00CEFFFF00000000005A5A5A00000000000000000000000000000000008484
      8400FFFFFF00FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00009CFFFF00CECECE0000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000009C00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000042424200B5B5B50000000000CEFF
      FF00C6D6EF00C6D6EF00C6C6C600C6D6EF00C6D6EF00C6C6C600C6C6C600C6D6
      EF00CEFFFF0000000000B5B5B500000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFF
      FF00FFFFFF00CECECE00000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600C6C6C600C6C6C600C6D6EF00C6C6C600C6D6
      EF00CEFFFF0000000000212121000000000000000000000000000000000031CE
      FF00FFFFFF00FF633100FF633100FF633100FF633100FF6331009CFFFF00FFFF
      FF00FFFFFF00CECECE00000000000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      000000000000000000000000000000000000000000000000000084000000FFCE
      3100FFFF9C008400000084000000840000008400000084000000000000000000
      000000000000000000000000000000000000000000000000000021212100CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000000000000031CEFF000000000031CE
      FF00FFFFFF0031CEFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF008484
      84000000000000000000000000000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000000000000000
      0000000000000000000000000000000000000000000084000000FFCE3100FFFF
      9C00FFFF9C00FFFF9C00FFFF9C00FFCE3100FFCE310084000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600CEFFFF00CEFFFF00CEFFFF00CEFFFF00D6E7
      E700C6D6EF00000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400FFFFFF0000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C310000000000000000000000
      00000000000000000000000000000000000000000000000000009C000000FFCE
      3100FFCE31009C0000009C0000009C0000008400000084000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00C6C6C6004A4A
      4A004A4A4A0000000000000000000000000031CEFF0031CEFF0031CEFF008484
      840031CEFF0031CEFF0031CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C00
      0000FFCE31009C00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00848484009CFF
      FF009CCECE00000000000000000000000000000000000000000031CEFF0031CE
      FF0031CEFF008484840084848400848484008484840084848400848484008484
      840000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C0000009C00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484009CCE
      CE00000000000000000000000000000000000000000031CEFF000000000031CE
      FF000000000031CEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000031CE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      0000000000000000000000000000CECE00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECE6300CECE63006363000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      000000000000CECE6300FFFF6300CECE6300CECE310063630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECE6300FFFF6300FFFF9C00CECE6300CECE3100CECE3100636300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000000000000000000000CECE
      6300CECE63006363310063633100636331006363310063633100636331006363
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313100003131
      00009C9C9C009C9C9C00B5B5B500B5B5B500DEDEDE0052525200313100003131
      0000313100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C00000000000000000063630000848400006363
      31009C9C9C00B5B5B500B5B5B500C6C6C600C6C6C60073737300525252006363
      0000636300006363000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084840000636300009C9C
      9C009C9C9C00B5B5B500B5B5B500C6C6C60084848400B5B5B500A5A5A5003131
      0000636300006363000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C000000000000000000000000000000000031310000636331009C9C
      9C00B5B5B500B5B5B500C6C6C600DEDEDE0084848400DEDEDE00A5A5A5005252
      5200636300003131000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C00B5B5B500B5B5B500C6C6C600C6C6C60063636300DEDEDE00B5B5B500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000000000000393939009C9C9C00B5B5
      B500FFFFFF00848484008484840039393900EFEFEF00DEDEDE00DEDEDE00B5B5
      B500212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039393900424242005252
      520052525200CECECE0084848400FFFFFF00C6C6C60063636300848484008484
      8400313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C0000000000000000008484840094949400A5A5
      A500B5B5B500CECECE006363630063636300C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000052525200A5A5
      A500B5B5B500DEDEDE00DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF008484
      8400393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      000063636300DEDEDE00DEDEDE00DEDEDE00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C3131009C3131009C3131009C3131009C3131009C3131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE0008080800000000000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000212121006331
      31009C6331009C6331009C6331009C6331009C6331009C3131009C3131009C31
      3100633131000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF000000000084848400FFFFFF009CFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000FF63000000000000000000000000000000000000633131009C633100CE63
      3100CE633100CE633100CE633100CE633100CE6331009C6331009C3131009C31
      31009C3131006331310000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FF63
      0000FF633100FF63000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000063313100CE9C9C00CE9C
      6300CE633100CE633100CE633100CE633100CE633100CE633100CE6331009C63
      31009C3131009C3131000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF0000000000000000000000000084848400FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FF63
      3100FF9C3100FF633100FF630000000000000000000000000000000000000000
      0000FF63310000000000000000000000000063313100CE9C9C00CE9C6300CE63
      3100CE633100CE633100FFFFFF00FFFFFF00CE9C9C00CE633100CE633100CE63
      31009C3131009C3131009C31310000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FF9C
      3100FF9C3100FF9C3100FF633100FF6300000000000000000000000000000000
      0000FF9C310000000000000000000000000063313100CE9C9C00CE9C9C00CE63
      3100CE9C6300FFFFFF00FFFFFF00EFEFEF00FFFFFF00CE9C9C00CE633100CE63
      31009C6331009C3131009C313100000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF0031313100000000000000000084848400FFFFFF00FFFFFF00FF63
      3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FF9C
      3100FF9C3100FFCE3100FFCE3100FF633100FF63310000000000000000000000
      0000FF9C310000000000000000000000000063313100CE9C9C00CE9C9C00CE9C
      6300EFEFEF00FFFFFF00CECE9C00CE9C6300EFEFEF00FFFFFF00CE9C9C00CE63
      3100CE6331009C6331009C3131000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C600000000000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE0008080800000000000000000000000000000000000000000000000000FF9C
      3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      0000FF9C310000000000000000000000000063313100CE9C9C00F7CEA500CE9C
      6300CE9C9C00CE9C9C00CE633100CE633100CE9C6300EFEFEF00FFFFFF00CECE
      9C00CE6331009C6331009C313100000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF00313131000000000084848400FFFFFF009CCECE009CCE
      CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FFCE
      3100FFCE3100FFFF9C00FFFFCE00FF6331000000000000000000000000000000
      0000FFCE310000000000000000000000000063313100CE9C9C00F7CEA500CE9C
      6300CE633100CE633100CE633100CE633100CE633100CE9C6300FFFFFF00FFFF
      FF00CECE9C009C6331009C3131000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C6000000000084848400FFFFFF00003100000031
      00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
      CE0000000000000000000000000000000000000000000000000000000000FFCE
      3100FFFF9C00FFFFCE00FF633100000000000000000000000000000000000000
      0000FFCE310000000000000000000000000063313100CE9C6300FFCECE00F7CE
      A500CE633100CE633100CE633100CE633100CE633100CE633100CE633100CE63
      3100CE6331009C6331009C3131000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF003131310084848400FFFFFF00639C9C00CEFF
      FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
      000008080800000000000808080000000000000000000000000000000000FFCE
      3100FFFFCE00FF63310000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000063313100CE9C9C00F7CE
      A500CE9C9C00CE633100CE633100CE633100CE633100CE633100CE633100CE63
      3100CE6331009C633100000000000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00639C
      9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
      9C00639C9C0000000000FF633100FF633100000000000000000000000000FFCE
      3100FF9C63000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000063313100CE9C6300F7CE
      A500F7CEA500CE9C9C00CE9C6300CE636300CE633100CE633100CE633100CE63
      3100CE63310063313100000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C6003131310000000000000000008484840084848400848484008484
      8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
      CE00639C9C00639C9C00FF9C3100FF9C3100000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000063313100CE9C
      6300CE9C9C00F7CEA500F7CEA500CE9C9C00CE9C6300CE633100CE633100CE63
      3100633131002121210000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      1800636363000000000000000000000000000000000000000000000000000000
      000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
      CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006331
      310063313100CE9C6300CE9C9C00CE9C9C00CE9C9C00CE9C9C009C6331006331
      310063313100000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00639C9C00FFFF9C00FFFF9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006331310063313100633131006331310063313100633131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
      9C00639C9C00FFFFFF00FF633100FF6331008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF633100FF63
      3100FF633100FF633100FF633100840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF63
      3100FF633100FF633100FF63310084000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF63000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF633100FF633100FF633100FF63
      3100FF633100FF633100FF633100FF63310084000000FFCE3100FF9C0000FF9C
      0000FF633100FF633100FF63310084000000000000000000000000000000FF63
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF630000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF9C00FFFF9C00FFFF9C0084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000FF630000FF63
      3100FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000FF633100FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF6300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000840000008400000084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000000000000000000000000000FF630000FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      00000000000000000000FF630000FF633100FF9C3100FF633100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF9C3100FF633100FF63000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00000000000084848400848484008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FF9C
      310000000000000000000000000000000000FF630000FF633100FF9C3100FF9C
      3100FF9C31000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF9C3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FF9C3100FF633100FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008484000084848400848484008484840084000000FFCE310000000000FF9C
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C31000000000000000000000000000000000000000000000000000000
      0000FF633100FF633100FFCE3100FFCE3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FFCE3100FFCE3100FF633100FF6331000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FFCE310084840000848484008484840084000000FFCE3100FFFFFF00FF9C
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C31000000000000000000000000000000000000000000000000000000
      0000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF6331000000
      0000000000000000000000000000000000008484000084840000848400008484
      0000FFCE3100FFCE3100848400008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE31000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFCE3100FFFF9C00FFFFCE00FF633100000000000000
      000000000000000000000000000000000000FFCE3100FFFF9C00FFFF9C00FFFF
      9C00FFFF9C00FFFF9C00FFCE31008400000084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      31000000000000000000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE31000000000000000000000000000000000000000000000000000000
      00000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000FFFF9C00FFCE3100840000008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000FF633100FFFF
      CE00FFCE31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF633100FFFFCE00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFFCE00FF6331000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FFCE310084000000848484008484840084000000FFCE3100FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000000000000000000000000000FF9C
      6300FFCE31000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF9C6300FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FF9C6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084848400848484008484840084848400FFFF9C00FF9C0000FF9C
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400FFFF9C00FF9C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400FFFF
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000029000000
      29000000940000007B000000FF000000CE000000CE000000940000007B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000000000000000
      FF000000940000007B0094949400A59C9C008484840063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00292929003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B0000007B7B7B0000000000000000000000000000000000000000000000
      7B0094949400BDBDBD00ADADAD00A59C9C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00BDBDBD007B7B7B0000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000000000000000000000FF633100FF63
      3100FF633100FF6331000000000000000000000000000000000000000000FF63
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B00
      00007B0000007B00000000000000000000000000000000000000000000000000
      0000CECECE00BDBDBD00ADADAD00A59C9C008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6007B7B7B007B7B7B00BDBDBD00292929003131310000000000000000005A5A
      5A0063636300000000000000000000000000FF633100FF9C3100FF9C3100FF9C
      3100FF6331000000000000000000000000000000000029292900FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B00
      00007B0000007B0000007B7B7B00000000000000000000000000000000001818
      180000000000BDBDBD00ADADAD00A59C9C000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B00A59C
      9C00CECECE00BDBDBD00BDBDBD0029292900313131004A4A4A00525252000000
      000000000000737373000000000000000000FF633100FFFF9C00FFCE31009C31
      00000000000000000000000000000000000029292900FF633100FF9C3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B0000007B00
      00007B0000007B0000007B000000000000000000000000000000181818001818
      18000000000000000000BDBDBD00CECECE00CECECE00CECECE00CECECE00BDBD
      BD00000000000000000000000000000000007B7B7B00A59C9C00DEDEDE00D6D6
      D600CECECE00BDBDBD00BDBDBD0029292900313131004A4A4A00525252005A5A
      5A0063636300000000000000000000000000FF633100FFFF9C009C3100000000
      0000000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000018181800181818001818
      1800000000000000000000000000DEDEDE00D6D6D600D6D6D600CECECE00BDBD
      BD00000000000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600CECECE00BDBDBD00FFFFFF0029292900313131004A4A4A00525252005A5A
      5A0063636300737373007B7B7B0000000000FF633100FFFF9C00FF9C31009C31
      0000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C3100CE6300009C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000018181800181818000000
      00000000000000000000BDBDBD00DEDEDE00DEDEDE00D6D6D600CECECE00BDBD
      BD00000000000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00BDBDBD00BDBDBD00BDBDBD004A4A4A00525252005A5A
      5A0063636300737373007B7B7B0000000000FF633100FFFF9C00FFCE3100FF9C
      31009C310000292929000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE3100CE9C3100CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000018181800181818000000
      000000000000BDBDBD00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00BDBDBD000000000000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE002929FF00FF00FF00BDBDBD00BDBDBD00BDBDBD005A5A
      5A0063636300737373007B7B7B0000000000FF633100FFFF9C00FFFFCE00FFCE
      3100FF9C31009C310000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE3100CE9C3100CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000018181800181818000000
      00000000000000000000BDBDBD00DEDEDE00DEDEDE00DEDEDE00FF000000DEDE
      DE00000000000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D60094FF940000FF0000D6D6D600CECECE00CECECE007B7B7B007B7B7B000000
      0000BDBDBD00737373007B7B7B0000000000FF633100FFFFCE00FFCE31000000
      0000000000000000000000000000000000000000000000000000FF633100FFFF
      CE0000000000FFCE3100CE63000000000000000000007B7B7B00000000000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      00007B0000000000000000000000000000000000000018181800181818001818
      180000000000000000000000000000000000DEDEDE00DEDEDE00000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B00FFFF
      FF00DEDEDE00BDBDBD00D6D6D6007B7B7B007B7B7B0094FFFF0094FFFF000000
      0000DEDEDE00000000000000000000000000FF633100FFFF9C00000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      31000000000000000000CE9C3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000018181800181818001818
      180000000000000000000000000000000000BDBDBD00DEDEDE00DEDEDE00CECE
      CE00000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B00FFFFFF007B7B7B0094FFFF0094FFFF0094FFFF00CEFFFF00CEFF
      FF0000000000000000000000000000000000FF633100FFCE3100FF9C31000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFCE31009C31000000000000000000007B7B7B000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000181818001818
      18001818180000000000000000000000000000000000BDBDBD00DEDEDE00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B0094FFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF0000000000000000000000000000000000FF633100FFCE3100FF9C
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100CE630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000181818001818
      1800181818001818180018181800181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00EFF7FF00EFF7FF0000000000000000000000000000000000FF633100FF63
      3100FF633100CE630000CE630000CE630000CE630000CE630000CE630000CE63
      0000CE630000CE63000000000000000000000000000000000000000000007B7B
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000000000001818
      1800181818001818180018181800181818000000000000000000000000000000
      0000181818000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400CEFFFF00EFF7FF00EFF7
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B0000000000000000000000000000000000000000000000000000000000
      0000181818001818180018181800181818001818180018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD00ADADAD00ADAD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002929CE002929CE000000
      FF00000094000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000008484
      840084848400848484008484840000000000000000002929CE002929CE000063
      FF000000FF000000940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000029292900004A4A007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800000000000000
      00000000000000000000000000000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00848484008484840084848400848484008484840000000000BDBD
      BD00FFFFFF00BDBDBD00848484000000000000000000000000002929CE002994
      FF000063FF000000CE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000042424200008484004AB5B500296B6B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000052525200CE636300CE636300212121000000
      00000000000000000000000000000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD008484840000000000BDBDBD00848484008484840000000000BDBD
      BD00FFFFFF00BDBDBD0084848400000000000000000000000000000000002929
      CE002994FF000000FF0000009400000000000000000000000000000000000000
      000000000000000000000000FF00000094000000000000000000000000000000
      000000000000A5A5A5000052520000DEDE0000EFEF0000BDBD00007373009494
      9400000000000000000000000000000000000000000000000000000000000000
      00000000000063636300CE949400CE949400CE949400CE949400CE9494003131
      31000000000000000000000000000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD008484840000000000BDBDBD00848484008484840000000000BDBD
      BD00FFFFFF00BDBDBD0084848400000000000000000000000000000000000000
      00000000CE000063FF0000009400000000000000000000000000000000000000
      0000000000000000FF0000009400000000000000000000000000000000000000
      0000000000005252520000D6D60000FFFF00009C9C0000FFFF00319494000073
      7300949494000000000000000000000000000000000000000000000000006363
      6300FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCECE00FFCE
      CE003131310000000000000000000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0084848400848484008484840084848400848484008484
      8400BDBDBD00BDBDBD0084848400000000000000000000000000000000000000
      0000000000000000CE000000FF00000094000000000000000000000000000000
      00000000FF000000940000000000000000000000000000000000000000000000
      000000000000006B6B0000E7E70000A5A50000F7F70000C6C60000E7E70031EF
      EF00007373007B7B7B0000000000000000000000000073737300E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E70031313100000000000000000084848400FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0084848400000000000000000000000000000000000000
      000000000000000000000000CE000000FF000000940000000000000000000000
      FF00000094000000000000000000000000000000000000000000000000000000
      00001818180000ADAD0000C6C60000FFFF0000BDBD0000DEDE0000CECE0039C6
      C60063D6D600296B6B007B7B7B000000000000000000ADADAD00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700313131000000000084848400FFFFFF00BDBDBD00BDBD
      BD00848484008484840084848400848484008484840084848400848484008484
      8400BDBDBD00BDBDBD0084848400000000000000000000000000000000000000
      00000000000000000000000000000000CE000000FF00000094000000FF000000
      9400000000000000000000000000000000000000000000000000000000000000
      0000311818005A94940018EFEF00009C9C0000EFEF0000CECE0029CECE0000FF
      FF0000ADAD0010F7F700005A5A00000000000000000000000000ADADAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00737373000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE000000FF00000094000000
      000000000000000000000000000000000000000000000000000000000000BDAD
      AD00E7C60000310000004294940000F7F70000E7E70042BDBD0000FFFF00008C
      8C0000FFFF005AA5A5000000000000000000000000000000000000000000ADAD
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD0084848400000000000000000000000000000000000000
      00000000000000000000000000000000CE000000FF00000094000000CE000000
      9400000000000000000000000000000000000000000000000000000000008C18
      0000FFFF0000C6AD630039080800399C9C0042BDBD0010EFEF0000B5B5007BD6
      D600004242000010100000000000000000000000000000000000000000000000
      0000ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      00000000000000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD0084848400000000000000000000000000000000000000
      000000000000000000000000CE000000FF000000940000000000000000000000
      CE00000094000000000000000000000000000000000000000000000000008C18
      0000CECEA500B5B59C00A5420000310000005A94940000A5A5004A6363000000
      0000525252000000000000000000000000000000000000000000000000000000
      000000000000ADADAD00FFEFCE00FFEFCE007373730000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD0084848400000000000000000000000000000000000000
      00000000CE000000CE000000FF00000094000000000000000000000000000000
      00000000CE000000940000000000000000000000000000000000AD736300FFFF
      3900BDBDAD00948442007B4A00007B00000031181800181818004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD00848484000000000000000000000000000000CE000000
      CE002994FF000000FF0000009400000000000000000000000000000000000000
      0000000000000000CE000000940000000000000000009C525200F7EF5200BDBD
      B5007B180000BDADAD00BDADAD00BDADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00000000008484840000000000000000000000CE002994FF000063
      FF000000FF000000940000000000000000000000000000000000000000000000
      000000000000000000000000CE000000940000000000CE9C0000BDBDA5008431
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00BDBDBD008484
      8400CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00FFFFFF00BDBDBD0084848400000000000000CE002994FF000063FF000000
      FF00000094000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000945A00006B4A18000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000636394000000CE000000CE006363
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF008007FFFF000000008003800100000000
      C000800100000000C00080010000000080008001000000008000800100000000
      8000800100000000C001800100000000C001800100000000E003800100000000
      F007800100000000F013800100000000C019800100000000800C800100000000
      000F800100000000080FFFFF00000000FFFFFFFFFF00FFFFFC3FFFFF8A00FFFF
      FC3FFFFF70000000FC3FFFFF00000000FC3FFFFF00000000FC3FFFFF00000000
      8001800100000000800180010000000080018001000000008001800100000000
      FC3FFFFF00000000FC3FFFFF00000000FC3FFFFF00000000FC3FFFFF00000000
      FC3FFFFF00000000FFFFFFFF0000FFFFFFBFFFFFFFFFFFFF8007FFFFFFFFFFCF
      8007FE07F83F00018007FDE3E00F00018007FBF1C007000180078071C0070831
      80078051800310018003804180032A7980038041800301018001804380030279
      80048041C00700018006807FC00721F1800F807FE00F0001801F80FFF83F0001
      803F81FFFFFF0001FFFFFFFFFFFF0001FFFFFFFFFE00FFFFFF7F80070000FFFF
      FE3F000000000000FC1F000000000000FE3F000000000000FF7F000000000000
      FF7F000000000000FE3F000700000000FE3F000300000000FC1F000100000000
      FC1F000000000000FC1F000000000000FC1F000000000000FC1F80000000FFFF
      FE3FC0010000FFFFFFFFE003FFFFFFFFFE3FFE3FF0078001E007E007E0030000
      80018001E001000000000000C001000000000000800080010000000080008001
      000000008000C00300000000C001C00300000000C001E00700000000E003E007
      00000000F007F00F00000000FC1FF00F00000000FC1FF81FC001C001F80FF81F
      F80FF80FF80FFC3FFFFFFFFFF80FFC7FFE3FFE3FFE3FFE3FE007E007E007E007
      8001000180018001000000010000000000000001000000000000000100000000
      0000000100000000000000010000000000000001000000000000000100000000
      000000010000000000000001000000000000000100000000C0018003C001C001
      F80FF01FF80FF80FFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFF800780028003FFC3
      800780038003CF9980008001C3FBC79F8000C001E1FBE39F8000C003F0FFF199
      8000C003F87FF8C38000C003FC3FFC7F8007C003FC3FFE3F8007C003F87FC31F
      8007C003F0FF998F8003C003E1FB9FC7800BC007C3FB9FE3801F8003800399F3
      803F001D8003C3FFFFFF9FFFFFFFFFFFFFF8FFFF0000E001FFF0FFCF0000E001
      FFE0FFC70000E001FFC1F8030000E001FF83F8010000E001FF07F8030000E001
      E00FFFC70000E001C01FFFCF0000E001803FF3FF0000E001003FE3FF8001E001
      003FC03FC003A001003F803FC003C003003FC03FC0030007807FE3FFC003C00F
      C0FFF3FFC007ABFFE1FFFFFFC00FEFFFFC7FFFFFFFFF8001FC7F8001FFFFFFFF
      F83FFFFFF00F8001F01FFE7FF81FFFFFE00FFC3FFC3F8001C007F81FFE7F75D6
      8003F00FFFFF00000001FFFF800174160001FFFFFFFF00018003F00F800155D9
      8007F81FFFFF00008007FC3FFE7F77768003FE7FFC3F80010003FFFFF81FFFFF
      80078001F00F8001E01FFFFFFFFFFFFFFFFFF81FFF180007CFE3E007FC000007
      C7E3C003F0000007C3E38001C0010007C1E38001C0030007C0E30000C0030007
      C063000080030007C023000000010007C023000080010007C063000000000007
      C0E3000000000000C1E3800100000000C3E3800100010000C7E3C0038003F800
      CFE3E007C007FC00FFFFF81FE00FFE000000FFFFFFFFFFFF0000C7F3FF9FF3FF
      0000C7E3FF1FF1FF0000C7C3FE1FF0FFF807C783FC1FF07FF807C703F81FF03F
      E807C603F01FF01FE007C403E01FF00FE007C403E01FF00F0007C603F01FF01F
      0007C703F81FF03F0007C783FC1FF07FE007C7C3FE1FF0FFE007C7E3FF1FF1FF
      F807C7F3FF9FF3FFF807FFFFFFFFFFFFFFFFFFFFC00FFC7FFFF781F7E01FF01F
      C1E79DE3E03FC00781C7CFE3E00F80010381E7C1C00780010700F3C1C0070001
      0E00B9F780070000060081F7800300000300FFF780070000000088F780070000
      00009CF7800780010000C1F78007E0070000C9F7C007F8038001E3F7C007FE00
      C003E3F7E007FF03FFFFF7F7F00FFF8FFFFF800187FFFFFFFFFF000083FFFE3F
      FF3F0000C3FEFC1FFC1F0000E1FCF80FF00F0000F1F9F807C0070000F8F3F803
      00030000FC67F00100010000FE0FF00180000000FF1FE001C0030000FE0FE003
      E00F0000FC67E007F03F0000F0F3C01FF8FF0000C1F980FFFFFF000083FC8FFF
      FFFF000007FF9FFFFFFF80010FFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object imgGenBW: TImageList
    Left = 112
    Top = 32
    Bitmap = {
      494C010132003600280010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420063636300636363006363630063636300636363006363
      6300636363003939390000000000000000000000000052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000525252008484
      84008484840084848400B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A500737373003939390073737300000000009C9C9C00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000212121005252
      5200848484008484840042424200636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C007373730042424200000000009C9C9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003939390063636300B5B5
      B500525252009494940042424200FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600636363004242420039393900000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE0084848400C6C6C60084848400CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003939390063636300B5B5
      B500D6D6D6005252520063636300424242006363630063636300FFFFFF00F7F7
      F70063636300424242006363630039393900000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E700636363006363630063636300E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700525252006363630042424200FFFFFF00FFFFFF006363
      630042424200B5B5B5006363630039393900000000009C9C9C00F7F7F700CECE
      CE00CECECE006363630094949400C6C6C6009494940063636300CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300525252006363630042424200636363004242
      4200C6C6C6009C9C9C004A4A4A0000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E70094949400E7E7E7009494940063636300CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF0063636300525252006363630042424200CECE
      CE00B5B5B500848484003939390000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE00636363006363630063636300CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600848484006363630042424200636363004242
      42009C9C9C00393939000000000000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE006363630094949400E7E7E70094949400E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000039393900636363008484840063636300424242009C9C9C009C9C9C006363
      630042424200000000000000000000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE006363630094949400C6C6C6009494940063636300CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0063636300424242005A5A5A005A5A5A00313131000000
      000063636300424242000000000000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E700636363006363630063636300E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A008484840063636300424242007373730094949400848484004A4A4A000000
      000000000000636363004242420000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE0084848400C6C6C60084848400CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      8400636363004242420094949400B5B5B500A5A5A500DEDEDE00848484003939
      390000000000000000007373730042424200000000009C9C9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A0000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300000000006363630039393900636363003939390063636300393939006363
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
      0000000000000000000000000000000000005A5A5A00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300737373007373
      730000000000C6C6C600000000005A5A5A005A5A5A00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400848484008484
      8400C6C6C600B5B5B500A5A5A500848484005A5A5A00A5A5A500949494000000
      00005A5A5A0084848400C6C6C600C6C6C6009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C60084848400C6C6
      C600B5B5B500A5A5A50084848400848484005A5A5A005A5A5A00C6C6C6000000
      00005A5A5A0084848400C6C6C600C6C6C6009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600848484008484
      8400C6C6C6008484840084848400848484005A5A5A00C6C6C600B5B5B500A5A5
      A50084848400C6C6C600C6C6C600C6C6C6009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400B5B5B500A5A5A5008484
      840084848400C6C6C600C6C6C600C6C6C6009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400A5A5A500848484008484
      840084848400C6C6C600C6C6C600C6C6C6009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600CECECE00CECECE00C6C6C60084848400D6D6D600D6D6
      D600C6C6C60084848400C6C6C600C6C6C6009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400D6D6D600D6D6D6005A5A5A0084848400D6D6D600D6D6D600D6D6
      D600C6C6C60084848400C6C6C600C6C6C6009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400C6C6C600D6D6D600D6D6D60084848400C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60084848400C6C6C6009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700A5A5A500F7F7F700F7F7F700F7F7F700A5A5A500F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400C6C6C600C6C6C60084848400D6D6D600D6D6
      D6005A5A5A0084848400C6C6C600C6C6C6009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600A5A5A500848484008484840084848400A5A5A500D6D6
      D600D6D6D600D6D6D600F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600D6D6
      D600D6D6D60084848400C6C6C600C6C6C6009C9C9C00F7F7F7009C9C9C00F7F7
      F700F7F7F700F7F7F700F7F7F700A5A5A500A5A5A500A5A5A500F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F7009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C60084848400C6C6C6009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400C6C6C6009C9C9C00D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D6009C9C9C00D6D6D600D6D6D600D6D6D6009C9C9C00D6D6
      D600D6D6D600D6D6D600D6D6D6009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400848484008484840084848400C6C6C6009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
      840084848400C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A0084848400525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5005A5A5A00848484006363630052525200B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000042424200525252007373730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000424A4200181818000000
      0000000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C6005A5A5A008484840063636300C6C6C600636363005252
      5200000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300949494006363630000000000000000000000000000000000000000000000
      0000313131003131310021212100424242005252520052525200636363000000
      00000000000000000000000000000000000000000000F7F7F700F7F7F700F7F7
      F700F7F7F70000000000F7F7F700F7F7F700424A4200F7F7F700181818000000
      0000F7F7F700F7F7F70000000000000000000000000084848400E7E7E7005252
      5200525252005252520063636300636363005252520052525200636363005252
      5200000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000000000000000000003131
      3100212121003131310031313100424242005252520052525200A5A5A5005252
      52000000000000000000000000000000000000000000F7F7F700F7F7F7000000
      0000000000000000000000000000424A4200F7F7F7001818180000000000F7F7
      F700F7F7F700F7F7F70000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E7006363
      6300525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000000000000313131003131
      310031313100313131004242420073737300A5A5A500A5A5A500525252004242
      42008484840000000000000000000000000000000000F7F7F700000000005A5A
      5A00000000005A5A5A005A5A5A00000000001818180000000000000000000000
      0000F7F7F700F7F7F70000000000000000000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300C6C6C6006363
      6300525252000000000000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000636363000000
      0000636363009494940063636300000000000000000000000000313131003131
      3100212121003131310042424200C6C6C6006363630063636300525252004242
      4200A5A5A50000000000000000000000000000000000000000005A5A5A000000
      0000ADADAD005A5A5A00F7F7F7005A5A5A0000000000F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B500636363005252520000000000000000000000000084848400C6C6C6005252
      5200525252005252520052525200B5B5B5000000000000000000636363006363
      6300636363009494940063636300000000000000000000000000313131002121
      2100212121004242420084848400C6C6C600A5A5A50073737300A5A5A5005252
      5200CECECE00000000000000000000000000000000000000000000000000ADAD
      AD00000000005A5A5A0000000000F7F7F7000000000000000000000000000000
      000000000000F7F7F70000000000000000000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B500636363005252520000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363009C9C
      9C00636363006363630063636300000000000000000000000000212121002121
      21003131310063636300A5A5A500DEDEDE00CECECE00A5A5A500848484004242
      4200CECECE000000000000000000000000000000000000000000ADADAD00F7F7
      F700ADADAD005A5A5A00ADADAD000000000000000000F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B50000000000636363005A5A5A00000000000000000084848400C6C6C6006363
      6300636363006363630063636300B5B5B5000000000000000000636363009C9C
      9C00B5B5B5006363630000000000000000000000000000000000313131003131
      3100525252007373730073737300CECECE00DEDEDE00C6C6C600A5A5A500DEDE
      DE008484840000000000000000000000000000000000000000005A5A5A00F7F7
      F700F7F7F7005A5A5A00000000005A5A5A000000000000000000000000000000
      000000000000F7F7F70000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B500000000000000000063636300525252000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363006363
      6300636363006363630063636300000000000000000000000000212121004242
      42005252520073737300C6C6C600DEDEDE00DEDEDE00CECECE00C6C6C600DEDE
      DE00CECECE0000000000000000000000000000000000F7F7F700000000005A5A
      5A00ADADAD005A5A5A005A5A5A0000000000F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000000000000000000000000000636363000000000084848400C6C6C6008484
      84008484840084848400C6C6C600B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420073737300A5A5A500A5A5A500DEDEDE00DEDEDE00DEDEDE00FFFFFF00F7FF
      FF000000000000000000000000000000000000000000F7F7F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700F7F7F70000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063636300A5A5A500CECECE00DEDEDE00DEDEDE00F7FFFF00F7FFFF000000
      00000000000000000000000000000000000000000000F7F7F700F7F7F700F7F7
      F700F7F7F70000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600F7FFFF00DEDEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0029292900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00292929004A4A4A0029292900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400EFEFEF00EFEFEF00FFFF
      FF00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0084848400848484008484
      84008484840084848400FFFFFF00848484008484000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084840000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0029292900ADADAD008C8C8C004A4A4A0029292900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400EFEFEF005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00000000006363630084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400B5B5B500EFEFEF00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      C600C6C6C600B5B5B500B5B5B50084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0029292900ADADAD0029292900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400EFEFEF00EFEFEF00E7E7
      E700E7E7E700E7E7E70000000000000000008484840084848400848484006363
      63006363630063636300000000008484840084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF008484840084848400EFEFEF00B5B5B500EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C600B5B5B500B5B5B50084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0029292900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400EFEFEF005252
      5200525252005252520000000000949494000000000000000000B5B5B500B5B5
      B5008484840084848400000000009494940084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF008484840084848400EFEFEF00EFEFEF00B5B5
      B500E7E7E700D6D6D600C6C6C600A5A5A500B5B5B500DEDEDE00DEDEDE00D6D6
      D600B5B5B500D6D6D600B5B5B50084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0029292900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400EFEFEF00EFEFEF00E7E7
      E700E7E7E700E7E7E70000000000C6C6C6009494940000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF008484840084848400EFEFEF00EFEFEF00E7E7
      E700B5B5B500C6C6C600B5B5B500D6D6D600D6D6D600A5A5A500DEDEDE00B5B5
      B500D6D6D600D6D6D600B5B5B50084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00292929004A4A4A0029292900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400A5A5A500A5A5A500A5A5
      A500A5A5A500B5B5B500B5B5B50000000000C6C6C60094949400000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF008484840084848400E7E7E700EFEFEF00D6D6
      D600C6C6C600B5B5B500DEDEDE00DEDEDE00DEDEDE00DEDEDE00A5A5A500DEDE
      DE00CECECE00D6D6D600B5B5B50084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00292929004A4A4A0029292900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400EFEFEF00EFEFEF00FFFF
      FF00FFFFFF00E7E7E700E7E7E700E7E7E7000000000000000000949494000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400E7E7E700DEDEDE00C6C6
      C600B5B5B500E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00A5A5
      A500D6D6D600DEDEDE00B5B5B50084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00292929008C8C8C004A4A4A004A4A4A0029292900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400EFEFEF005252
      5200525252005252520052525200525252005252520052525200E7E7E7009494
      940000000000E7E7E700848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF008484840084848400E7E7E700D6D6D600B5B5
      B500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E700A5A5A500D6D6D600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00292929008C8C8C004A4A4A004A4A4A0029292900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400EFEFEF00EFEFEF00FFFF
      FF00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E7009494940084848400E7E7E700848484008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008484840084848400DEDEDE00B5B5B500F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00B5B5B500B5B5B50084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0029292900ADADAD004A4A4A004A4A4A0029292900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400EFEFEF005252
      5200525252005252520052525200525252005252520052525200E7E7E700C6C6
      C6008484840094949400E7E7E7008484840084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      84008484840084848400848484008484840084848400B5B5B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700A5A5A50084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0029292900ADADAD008C8C8C004A4A4A0029292900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400EFEFEF00EFEFEF00FFFF
      FF00FFFFFF00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E70084848400A5A5A500B5B5B5008484840084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C600848484008484000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084840000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0029292900ADADAD00ADADAD008C8C8C0029292900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B50084848400E7E7E700E7E7E7008484840084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00292929002929290029292900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF008484840084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393939003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000000000000094949400949494009494
      9400949494009494940094949400949494009494940094949400949494009494
      9400949494009494940094949400000000000000000000000000000000000000
      000000000000B5B5B5009C9C9C00949494009C9C9C0084848400848484008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      000000000000848484006B6B6B00737373005A5A5A0039393900313131004242
      4200000000000000000000000000000000000000000000000000000000003939
      3900737373006363630063636300636363006363630063636300636363006363
      6300636363003939390000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A00949494009494940000000000FFFFFF009C9C9C009494
      9400949494009C9C9C00B5B5B500D6D6D6009494940084848400B5B5B5009C9C
      9C0094949400848484009C9C9C000000000000000000B5B5B5006B6B6B006B6B
      6B008484840084848400B5B5B500D6D6D6006B6B6B0042424200949494006B6B
      6B0042424200313131005A5A5A00000000000000000000000000000000004A4A
      4A00A5A5A500A5A5A500B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A500737373003939390000000000B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500737373004A4A4A00949494000000000094949400B5B5B500B5B5
      B500B5B5B5009C9C9C009C9C9C00B5B5B5009494940084848400B5B5B500B5B5
      B50094949400B5B5B5008484840000000000000000006B6B6B0094949400B5B5
      B500B5B5B500FFFFFF00FFFFFF00FFFFFF008484840042424200B5B5B5005252
      52009C9C9C00B5B5B5004A4A4A0000000000000000000000000021212100A5A5
      A500C6C6C600DEDEDE00FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C003939390000000000B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500737373004A4A4A0073737300B5B5B500B5B5B500B5B5
      B500B5B5B500737373004A4A4A0094949400000000009C9C9C00949494009494
      94009C9C9C00D6D6D600B5B5B500B5B5B5009494940084848400B5B5B5008484
      840094949400848484008484840000000000000000006B6B6B00848484008484
      84009C9C9C00FFFFFF00FFFFFF00FFFFFF008484840042424200B5B5B5005A5A
      5A0084848400B5B5B5009C9C9C0000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F70063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600B5B5B500636363003939390000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500737373004A4A4A0073737300B5B5B500B5B5B500B5B5
      B500B5B5B5004A4A4A0094949400000000000000000094949400FFFFFF009494
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF009494940084848400848484008484
      84009C9C9C009C9C9C00B5B5B50000000000000000006B6B6B00FFFFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840042424200B5B5B5005252
      520084848400B5B5B500B5B5B50000000000000000003939390063636300B5B5
      B500D6D6D600F7FFFF00FFFFFF00FFFFFF006363630063636300FFFFFF00F7F7
      F700CECECE00B5B5B500636363003939390000000000B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B50073737300B5B5B500B5B5B500B5B5B500B5B5
      B500737373004A4A4A009494940000000000000000009C9C9C00FFFFFF009494
      94009C9C9C0094949400FFFFFF00FFFFFF009494940084848400949494008484
      84009C9C9C0084848400B5B5B50000000000000000006B6B6B00FFFFFF008484
      84008484840084848400FFFFFF00FFFFFF008484840042424200B5B5B5003939
      39005A5A5A00B5B5B500B5B5B50000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700FFFFFF006363630063636300FFFFFF00FFFFFF00EFEF
      EF00D6D6D600B5B5B50063636300393939000000000000000000B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5004A4A4A00B5B5B500B5B5B500B5B5B500B5B5
      B5004A4A4A00949494000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00B5B5B500B5B5B500FFFFFF00FFFFFF009C9C9C0084848400B5B5B5008484
      84009494940084848400B5B5B50000000000000000006B6B6B00FFFFFF008484
      8400B5B5B50084848400FFFFFF00D6D6D6008484840042424200B5B5B5005A5A
      5A0052525200B5B5B500B5B5B5000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C6009C9C9C004A4A4A00000000000000000000000000B5B5B500B5B5
      B500B5B5B500B5B5B500737373004A4A4A0073737300B5B5B500B5B5B5007373
      73004A4A4A00949494000000000000000000000000009C9C9C00FFFFFF009C9C
      9C00FFFFFF00D6D6D600B5B5B500B5B5B5009C9C9C0084848400B5B5B500B5B5
      B50084848400B5B5B500B5B5B50000000000000000006B6B6B00FFFFFF008484
      8400FFFFFF00D6D6D6008C8C8C009C9C9C008484840042424200B5B5B5005A5A
      5A005A5A5A0039393900B5B5B500000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B500848484003939390000000000000000000000000000000000B5B5
      B500B5B5B500B5B5B5004A4A4A004A4A4A004A4A4A00B5B5B500B5B5B5004A4A
      4A0094949400000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C0094949400B5B5B500B5B5B5009494940084848400B5B5B500B5B5
      B500B5B5B500B5B5B5009C9C9C0000000000000000006B6B6B00848484008484
      840084848400848484008C8C8C00B5B5B5008484840042424200B5B5B500B5B5
      B5003939390039393900B5B5B500000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600FFFFFF0063636300FFFFFF00CECECE00B5B5
      B5009C9C9C00393939000000000000000000000000000000000000000000B5B5
      B500B5B5B500B5B5B5004A4A4A004A4A4A004A4A4A00B5B5B500737373004A4A
      4A00949494000000000000000000000000000000000094949400D6D6D600D6D6
      D600B5B5B5009C9C9C00B5B5B500D6D6D600D6D6D600B5B5B5009C9C9C008484
      84009C9C9C00B5B5B5008484840000000000000000006B6B6B00D6D6D600D6D6
      D6009C9C9C008484840084848400848484008C8C8C0063636300424242004A4A
      4A0084848400B5B5B50084848400000000000000000000000000000000000000
      000039393900636363009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C007373
      7300393939000000000000000000000000000000000000000000000000000000
      0000B5B5B500B5B5B5004A4A4A004A4A4A004A4A4A00B5B5B5004A4A4A009494
      940000000000000000000000000000000000000000009C9C9C00B5B5B500D6D6
      D600D6D6D600B5B5B5009C9C9C00B5B5B500D6D6D600D6D6D600B5B5B5009494
      9400B5B5B5009C9C9C0084848400000000000000000084848400848484008484
      8400848484005A5A5A006B6B6B0084848400B5B5B500B5B5B500848484004A4A
      4A00525252004A4A4A0039393900000000000000000000000000000000000000
      0000000000000000000031313100636363005A5A5A005A5A5A00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B500B5B5B500737373004A4A4A0073737300737373004A4A4A009494
      94000000000000000000000000000000000000000000B5B5B50094949400B5B5
      B500D6D6D600D6D6D600B5B5B5009494940094949400949494009C9C9C00B5B5
      B500D6D6D600B5B5B500B5B5B50000000000000000006B6B6B006B6B6B008484
      8400D6D6D600B5B5B5006B6B6B006363630063636300636363005A5A5A009C9C
      9C00D6D6D600848484004A4A4A00000000000000000000000000000000000000
      000000000000000000004A4A4A007373730094949400848484004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B500B5B5B5004A4A4A00949494000000
      0000000000000000000000000000000000000000000000000000000000009494
      94009C9C9C00D6D6D6009C9C9C00B5B5B500B5B5B5009C9C9C00D6D6D600B5B5
      B5009C9C9C009494940000000000000000000000000000000000000000005252
      520084848400D6D6D600636363009C9C9C008484840063636300B5B5B5008484
      84006B6B6B004A4A4A0000000000000000000000000000000000000000000000
      0000000000003939390094949400B5B5B500A5A5A500DEDEDE00848484003939
      3900000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B500737373004A4A4A00949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C009C9C9C00949494009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A0084848400525252004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B500B5B5B5004A4A4A0094949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A009494940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A00636363006B6B6B005A5A5A0039393900424242002929
      2900000000000000000000000000000000000000000000000000000000000000
      0000000000002929290039393900393939002929290018181800181818000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840063636300737373005252520039393900292929005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A0039393900525252001818180018181800181818003131
      310000000000000000000000000000000000000000006B6B6B00636363008484
      8400848484009C9C9C008C8C8C00B5B5B5008484840039393900B5B5B5008484
      84004A4A4A004242420039393900000000000000000029292900393939004242
      42004A4A4A00D6D6D600FFFFFF007373730039393900848484009C9C9C004A4A
      4A0018181800181818000000000000000000000000008C8C8C00636363006363
      63008484840094949400A5A5A500D6D6D6007373730039393900B5B5B5007373
      73004A4A4A00292929008C8C8C00000000000000000073737300393939003939
      3900525252009C9C9C00B5B5B500B5B5B50052525200181818009C9C9C005A5A
      5A0039393900181818007373730000000000000000006B6B6B009C9C9C008484
      8400FFFFFF008484840084848400FFFFFF008484840039393900B5B5B5004A4A
      4A006B6B6B008484840042424200000000003939390073737300737373003939
      39003939390039393900737373009C9C9C0039393900B5B5B500393939003939
      3900101010005A5A5A0018181800000000000000000073737300A5A5A5008C8C
      8C007373730084848400EFEFEF00FFFFFF008484840039393900B5B5B5009494
      94008C8C8C009C9C9C0039393900000000000000000052525200B5B5B500D6D6
      D6008C8C8C00ADADAD00FFFFFF00FFFFFF005252520031313100737373001818
      18005A5A5A00848484001818180000000000000000009C9C9C00848484009C9C
      9C00FFFFFF009C9C9C00B5B5B500FFFFFF008484840039393900848484004A4A
      4A004A4A4A00424242006B6B6B0000000000393939004A4A4A00393939009C9C
      9C00FFFFFF0073737300393939009C9C9C0039393900B5B5B500393939003939
      3900949494003131310018181800000000000000000094949400B5B5B5008484
      8400F7F7F700B5B5B50084848400FFFFFF008484840039393900949494006363
      63008C8C8C0084848400737373000000000000000000A5A5A500525252005252
      520063636300525252007B7B7B00FFFFFF005252520031313100181818008484
      84001818180073737300424242000000000000000000B5B5B500DEDEDE008484
      8400B5B5B50084848400FFFFFF00FFFFFF0084848400393939006B6B6B006B6B
      6B00B5B5B50042424200848484000000000039393900FFFFFF0039393900FFFF
      FF00FFFFFF0073737300393939009C9C9C0039393900B5B5B500393939003939
      39009C9C9C00181818001818180000000000000000009494940094949400B5B5
      B500FFFFFF00F7F7F700B5B5B500FFFFFF008484840039393900636363008C8C
      8C00B5B5B5008C8C8C00848484000000000000000000D6D6D60073737300B5B5
      B500FFFFFF008C8C8C0052525200FFFFFF006B6B6B003131310018181800B5B5
      B50018181800737373005A5A5A0000000000000000009C9C9C00FFFFFF008484
      84009C9C9C0084848400FFFFFF00FFFFFF008484840039393900848484004A4A
      4A00B5B5B50042424200848484000000000039393900FFFFFF00393939006B6B
      6B003939390039393900DEDEDE009C9C9C0039393900B5B5B500393939003131
      3100181818004A4A4A001818180000000000000000009494940084848400B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840039393900636363008C8C
      8C00B5B5B500B5B5B500848484000000000000000000D6D6D60073737300BDBD
      BD00FFFFFF00FFFFFF0052525200FFFFFF0052525200424242004A4A4A001818
      180018181800737373005A5A5A0000000000000000009C9C9C00FFFFFF009C9C
      9C00D6D6D60084848400FFFFFF00FFFFFF008484840039393900B5B5B5004A4A
      4A004242420042424200848484000000000039393900FFFFFF00393939009C9C
      9C00FFFFFF00393939006B6B6B009C9C9C0039393900B5B5B500393939008484
      8400B5B5B500B5B5B5001818180000000000000000009494940073737300B5B5
      B500FFFFFF00E7E7E70084848400FFFFFF008484840039393900949494006363
      63008C8C8C0063636300848484000000000000000000D6D6D60073737300BDBD
      BD00FFFFFF00BDBDBD0052525200FFFFFF005252520031313100B5B5B500B5B5
      B5005A5A5A00737373005A5A5A000000000000000000B5B5B500FFFFFF00D6D6
      D600848484008C8C8C00FFFFFF00FFFFFF008484840039393900B5B5B500B5B5
      B500B5B5B5004A4A4A00848484000000000039393900FFFFFF0039393900FFFF
      FF00FFFFFF0039393900737373009C9C9C0039393900B5B5B500393939008484
      8400B5B5B500B5B5B50018181800000000000000000094949400B5B5B5008484
      8400B5B5B5009494940084848400FFFFFF008484840039393900B5B5B500A5A5
      A50084848400B5B5B500848484000000000000000000D6D6D60073737300BDBD
      BD00DEDEDE00525252007B7B7B00FFFFFF005252520031313100B5B5B500B5B5
      B5005A5A5A00737373005A5A5A0000000000000000009C9C9C00FFFFFF00B5B5
      B5008484840084848400D6D6D6009C9C9C008484840039393900B5B5B500B5B5
      B500B5B5B500B5B5B50084848400000000003939390073737300393939003939
      39003939390073737300CECECE0039393900393939005A5A5A00636363008484
      8400B5B5B500B5B5B50018181800000000000000000094949400FFFFFF008484
      84007373730084848400FFFFFF00D6D6D6007373730039393900B5B5B500B5B5
      B500B5B5B500B5B5B500848484000000000000000000A5A5A500525252005252
      52005252520052525200FFFFFF009C9C9C007373730018181800B5B5B500B5B5
      B5005A5A5A00737373005A5A5A00000000000000000084848400FFFFFF00B5B5
      B500848484008484840084848400848484006B6B6B0063636300424242003939
      390084848400B5B5B500525252000000000039393900D6D6D600CECECE008C8C
      8C00393939003939390042424200525252003939390029292900212121001818
      1800848484008484840018181800000000000000000094949400FFFFFF00FFFF
      FF008C8C8C008484840084848400949494009494940063636300393939005A5A
      5A00B5B5B500B5B5B500525252000000000000000000B5B5B500DEDEDE00BDBD
      BD00737373006B6B6B0073737300848484007373730052525200181818004242
      420084848400B5B5B50031313100000000000000000084848400848484008C8C
      8C00636363006B6B6B00B5B5B500D6D6D6006B6B6B00D6D6D600B5B5B5005A5A
      5A00525252004242420039393900000000003939390039393900525252005252
      52003131310042424200D6D6D6009C9C9C0042424200CECECE004A4A4A002929
      2900292929001818180018181800000000000000000073737300848484009494
      940084848400636363009494940094949400B5B5B500A5A5A500949494005A5A
      5A00525252003939390039393900000000000000000052525200737373008484
      8400737373005252520084848400A5A5A5005A5A5A00A5A5A500848484003939
      390039393900181818001818180000000000000000005A5A5A0084848400B5B5
      B500D6D6D600B5B5B5006363630063636300636363006363630063636300B5B5
      B500D6D6D600B5B5B5004A4A4A00000000005252520029292900A5A5A500D6D6
      D600D6D6D6006B6B6B002929290029292900292929002929290063636300D6D6
      D600D6D6D600424242003939390000000000000000007373730063636300A5A5
      A500D6D6D600B5B5B5004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008C8C
      8C00D6D6D600949494005A5A5A0000000000000000005252520073737300B5B5
      B500D6D6D6008C8C8C0039393900393939003939390039393900393939008484
      8400D6D6D6008484840042424200000000000000000000000000000000005A5A
      5A006B6B6B00B5B5B50063636300B5B5B5008484840063636300B5B5B5006B6B
      6B00525252005252520000000000000000000000000000000000000000003131
      31007373730029292900636363006B6B6B002929290042424200848484004242
      4200393939000000000000000000000000000000000000000000000000005A5A
      5A0094949400CECECE005A5A5A008C8C8C005A5A5A004A4A4A00D6D6D6007373
      73005A5A5A005A5A5A0000000000000000000000000000000000000000004242
      420084848400A5A5A50039393900737373004A4A4A0039393900D6D6D6008484
      8400525252005252520000000000000000000000000000000000000000000000
      000000000000000000005A5A5A006B6B6B005252520052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000313131004A4A4A003939390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00737373005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039393900848484003939390052525200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000525252008484
      84008484840084848400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500000000000000000073737300000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A00000000000000000000000000000000005A5A5A00B5B5
      B50000000000000000000000000000000000000000005A5A5A005A5A5A000000
      0000000000005A5A5A005A5A5A00000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000848484005252
      5200848484008484840042424200E7E7E700C6C6C600E7E7E700C6C6C600E7E7
      E700B5B5B50000000000737373004242420000000000000000005A5A5A005A5A
      5A005A5A5A00FFFFFF0000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000B5B5B5005A5A
      5A00B5B5B500000000000000000000000000000000005A5A5A005A5A5A000000
      0000000000000000000000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A000000000063636300000000000000000084848400E7E7
      E70052525200949494004242420052525200525252005252520052525200C6C6
      C600B5B5B5006363630042424200000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00FFFFFF00000000000000000000000000000000000000
      0000000000005A5A5A000000000000000000000000000000000000000000B5B5
      B5005A5A5A00B5B5B5000000000000000000000000005A5A5A005A5A5A000000
      0000000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      630063636300636363000000000084848400000000000000000084848400E7E7
      E700C6C6C600525252006363630042424200C6C6C600E7E7E700C6C6C600E7E7
      E700636363004242420000000000000000000000000000000000000000000000
      00005A5A5A005A5A5A005A5A5A00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B5005A5A5A00B5B5B50000000000000000005A5A5A005A5A5A000000
      0000000000005A5A5A005A5A5A00000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B50084848400848484000000000094949400000000000000000084848400E7E7
      E700636363006363630052525200636363004242420063636300636363006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A005A5A5A00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B5005A5A5A00B5B5B50000000000000000005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000084848400E7E7
      E700C6C6C600E7E7E700C6C6C600525252006363630042424200636363004242
      4200B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A005A5A5A005A5A5A00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B5005A5A5A00B5B5B50000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E70073737300737373007373730073737300525252006363630042424200C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF005A5A5A005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5B5B5005A5A5A00B5B5B500000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700E7E7E700E7E7E700C6C6C600848484006363630042424200636363004242
      4200B5B5B5000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF005A5A5A005A5A5A005A5A5A0000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A005A5A5A000000000000000000B5B5B5005A5A5A00B5B5B5000000
      0000000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      940000000000000000000000000000000000000000000000000084848400E7E7
      E7008484840084848400848484006363630042424200C6C6C600E7E7E7006363
      6300424242000000000000000000000000000000000000000000000000000000
      0000FFFFFF005A5A5A005A5A5A005A5A5A000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A000000
      0000000000005A5A5A005A5A5A000000000000000000B5B5B5005A5A5A00B5B5
      B500000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      000094949400000000000000000000000000000000000000000084848400E7E7
      E7004A4A4A004A4A4A006363630042424200C6C6C600E7E7E700848484000000
      000063636300424242000000000000000000000000000000000000000000FFFF
      FF005A5A5A005A5A5A005A5A5A00000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000005A5A5A005A5A5A000000
      0000000000000000000000000000000000000000000000000000B5B5B5005A5A
      5A00B5B5B5000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      00000000000094949400000000000000000000000000000000004A4A4A004A4A
      4A00848484006363630042424200E7E7E700E7E7E700E7E7E70084848400FFFF
      FF00000000006363630042424200000000000000000000000000FFFFFF005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      0000000000005A5A5A000000000000000000000000005A5A5A005A5A5A000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B5005A5A5A00B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      84006363630042424200E7E7E700E7E7E700E7E7E700E7E7E700848484000000
      00000000000000000000737373004242420000000000FFFFFF005A5A5A005A5A
      5A005A5A5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005A5A5A000000000000000000000000005A5A5A005A5A5A000000
      0000000000005A5A5A005A5A5A00000000000000000000000000000000000000
      0000B5B5B5005A5A5A0000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242008484840084848400848484008484840084848400848484000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A00000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242007373730084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000313131003131
      3100000000000000000000000000000000004A4A4A00CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600B5B5B500B5B5B5004A4A4A000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420073737300C6C6C600B5B5B500424242000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031313100A5A5
      A500424242000000000000000000000000004A4A4A00D6D6D600EFEFEF00EFEF
      EF00DEDEDE00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600C6C6C6009C9C9C004A4A4A000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242007373
      7300A5A5A500C6C6C60042424200000000000000000000000000000000000000
      000000000000313131003131310031313100313131003131310031313100DEDE
      DE00A5A5A5004242420000000000000000004A4A4A005A5A5A00CECECE00DEDE
      DE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600B5B5B5005A5A5A004A4A4A000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004242420073737300A5A5
      A500B5B5B5004242420000000000000000000000000000000000000000000000
      0000000000004242420094949400A5A5A500B5B5B500DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00A5A5A50042424200000000004A4A4A00E7E7E7005A5A5A00C6C6
      C600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00B5B5B5005A5A5A00B5B5B5004A4A4A000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      00000000000042424200424242005A5A5A005A5A5A005A5A5A005A5A5A00A5A5
      A500949494004242420000000000000000004A4A4A00E7E7E700DEDEDE005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00E7E7E700C6C6C6004A4A4A000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000000000000000000004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A009494
      9400424242000000000000000000000000004A4A4A00E7E7E7005A5A5A00DEDE
      DE00DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00DEDEDE005A5A5A00C6C6C6004A4A4A000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B5000000000000000000000000000000000042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A00000000000000000000000000000000004A4A4A005A5A5A004A4A4A00EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00DEDE
      DE00EFEFEF004A4A4A005A5A5A004A4A4A000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A00B5B5B5004A4A4A00EFEF
      EF00DEDEDE00DEDEDE00C6C6C600DEDEDE00DEDEDE00C6C6C600C6C6C600DEDE
      DE00EFEFEF004A4A4A00B5B5B5004A4A4A000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B500000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200A5A5A5003131310000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A00EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00EFEFEF004A4A4A004A4A4A00000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B500000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      000000000000000000000000000000000000000000000000000042424200A5A5
      A500DEDEDE005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF004A4A4A0000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      84000000000000000000000000000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200000000000000
      0000000000000000000000000000000000000000000042424200A5A5A500DEDE
      DE00DEDEDE00DEDEDE00B5B5B500A5A5A500949494005A5A5A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00EFEF
      EF00DEDEDE00C6C6C600C6C6C600EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6E7
      E700DEDEDE004A4A4A0000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E70000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A50042424200000000000000
      0000000000000000000000000000000000000000000000000000424242009494
      9400A5A5A5003131310031313100313131005A5A5A005A5A5A00000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00C6C6C6004A4A
      4A004A4A4A004A4A4A0000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C600848484004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200949494003131310000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF0084848400EFEF
      EF00DEDEDE004A4A4A0000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      840000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131003131310000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400DEDE
      DE00636363000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000737373000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073737300737373006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000007373730084848400737373007373730063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000737373008484840084848400737373007373730073737300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000007373
      7300737373006363630063636300636363006363630063636300636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A000000000000000000393939003939
      39009C9C9C009C9C9C00B5B5B500B5B5B500DEDEDE0052525200393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A00000000005A5A5A00636363005A5A
      5A009C9C9C00B5B5B500B5B5B500C6C6C600C6C6C60073737300525252006363
      6300636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0000000000636363005A5A5A009C9C
      9C009C9C9C00B5B5B500B5B5B500C6C6C60084848400B5B5B500A5A5A5003939
      3900636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A000000000000000000313100005A5A5A009C9C
      9C00B5B5B500B5B5B500C6C6C600DEDEDE0084848400DEDEDE00A5A5A5005252
      5200636363003131000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000000000000000000009C9C9C009C9C
      9C00B5B5B500B5B5B500C6C6C600C6C6C60063636300DEDEDE00B5B5B500A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0000000000393939009C9C9C00B5B5
      B500FFFFFF00848484008484840039393900EFEFEF00DEDEDE00DEDEDE00B5B5
      B500212121000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A000000000039393900424242005252
      520052525200CECECE0084848400FFFFFF00C6C6C60063636300848484008484
      8400313131000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A004A4A4A004A4A4A00000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C0000000000000000008484840094949400A5A5
      A500B5B5B500CECECE006363630063636300C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000052525200A5A5
      A500B5B5B500DEDEDE00DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF008484
      840039393900000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      00004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      000063636300DEDEDE00DEDEDE00DEDEDE00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000004242420000000000000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420042424200424242004242420042424200424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00004242420073737300848484000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A0000000000000000000000000000000000000000005A5A5A005A5A
      5A00636363006363630063636300636363006363630042424200424242004242
      4200313131000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B5004242420084848400FFFFFF00DEDEDE009494
      940094949400FFFFFF0094949400949494009494940094949400FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      00005A5A5A00000000000000000000000000000000005A5A5A00B5B5B5007373
      7300737373007373730073737300737373007373730063636300424242004242
      4200424242003131310000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C600424242000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000005A5A
      5A00737373008484840000000000000000000000000000000000000000000000
      00005A5A5A00000000000000000000000000000000005A5A5A00A5A5A500B5B5
      B500737373007373730073737300737373007373730073737300737373006363
      630042424200424242000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B50042424200000000000000000084848400FFFFFF00FFFFFF00A5A5
      A500A5A5A500FFFFFF00A5A5A500A5A5A500A5A5A500A5A5A500FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000007373
      7300B5B5B5008484840084848400000000000000000000000000000000000000
      0000848484000000000000000000000000005A5A5A00A5A5A500B5B5B5007373
      73007373730073737300D6D6D600D6D6D6009494940073737300737373007373
      730042424200424242004242420000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B5004242420000000000000000000000000084848400FFFFFF00DEDEDE00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500B5B5B50084848400949494000000000000000000000000000000
      0000B5B5B5000000000000000000000000005A5A5A00A5A5A500A5A5A5007373
      730073737300D6D6D600D6D6D600EFEFEF00D6D6D60094949400737373007373
      7300636363004242420042424200000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF0031313100000000000000000084848400FFFFFF00FFFFFF00B5B5
      B500B5B5B500FFFFFF00B5B5B500B5B5B500B5B5B500B5B5B500FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C0000000000000000000000
      0000B5B5B5000000000000000000000000005A5A5A00A5A5A500A5A5A5007373
      7300D6D6D600D6D6D6008484840084848400EFEFEF00D6D6D600949494007373
      73007373730063636300424242000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C600000000000000000084848400FFFFFF00FFFFFF00DEDE
      DE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE0008080800000000000000000000000000000000000000000000000000B5B5
      B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      0000B5B5B5000000000000000000000000005A5A5A00A5A5A500C6C6C6007373
      73007373730073737300737373007373730084848400EFEFEF00D6D6D6009494
      9400737373006363630042424200000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF00313131000000000084848400FFFFFF00CECECE00CECE
      CE00DEDEDE00FFFFFF00DEDEDE00CECECE0000000000CECECE00DEDEDE00CECE
      CE0000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600CECECE00DEDEDE009C9C9C000000000000000000000000000000
      0000CECECE000000000000000000000000005A5A5A00A5A5A500C6C6C6007373
      7300737373007373730073737300737373007373730084848400D6D6D600D6D6
      D6009C9C9C0063636300424242000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C6000000000084848400FFFFFF00003100000031
      0000CECECE00FFFFFF00CECECE0000310000CECECE0000000000CECECE00CECE
      CE0000000000000000000000000000000000000000000000000000000000C6C6
      C600CECECE00DEDEDE009C9C9C00000000000000000000000000000000000000
      0000CECECE000000000000000000000000005A5A5A00B5B5B500CECECE00C6C6
      C600737373007373730073737300737373007373730073737300737373007373
      73007373730063636300424242000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF003131310084848400FFFFFF009C9C9C00D6D6
      D60000310000CECECE0000310000CECECE0094949400CECECE00000000000000
      000008080800000000000808080000000000000000000000000000000000C6C6
      C600DEDEDE009C9C9C0000000000000000000000000000000000000000000000
      0000CECECE00000000000000000000000000000000005A5A5A00A5A5A500C6C6
      C600A5A5A5007373730073737300737373007373730073737300737373007373
      73007373730063636300000000000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF009C9C
      9C00D6D6D60000310000CECECE0094949400CECECE00949494009C9C9C009C9C
      9C009C9C9C00000000009C9C9C009C9C9C00000000000000000000000000C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      0000CECECE00000000000000000000000000000000005A5A5A00B5B5B500C6C6
      C600C6C6C600A5A5A500B5B5B500848484007373730073737300737373007373
      73007373730063636300000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C6003131310000000000000000008484840084848400848484008484
      84009C9C9C00D6D6D60000310000CECECE0094949400C6C6C600C6C6C600C6C6
      C6009C9C9C009C9C9C00B5B5B500B5B5B500000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000CECECE0000000000000000000000000000000000000000005A5A5A00B5B5
      B500A5A5A500C6C6C600C6C6C600A5A5A500C6C6C60073737300737373007373
      7300636363002121210000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      1800636363000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00D6D6D60000310000E7E7E700E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005A5A
      5A005A5A5A00B5B5B500A5A5A500A5A5A500A5A5A500A5A5A500B5B5B5006363
      630063636300000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7
      E700E7E7E7009C9C9C00CECECE00CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00FFFFFF009C9C9C009C9C9C004242420042424200424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      84008484840084848400848484008484840042424200B5B5B500848484008484
      8400848484008484840084848400424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      84008484840084848400848484008484840042424200B5B5B500949494008484
      8400848484008484840084848400424242000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      84008484840084848400848484008484840042424200B5B5B500949494009494
      9400848484008484840084848400424242000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B50042424200B5B5B500949494009494
      9400424242000000000000000000000000000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000848484007373
      73005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400737373005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0073737300848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000042424200424242004242420042424200B5B5B500949494009494
      9400424242000000000000000000000000000000000000000000000000008484
      840000000000000000000000000000000000000000008484840084848400B5B5
      B500737373000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400B5B5B50073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073737300B5B5B500848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      63000000000084848400848484008484840042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000B5B5
      B500000000000000000000000000000000009494940084848400B5B5B500B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      0000000000009494940084848400B5B5B500B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B5008484840094949400000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300A5A5A50084848400848484008484840042424200B5B5B500424242009494
      940042424200000000000000000000000000000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C009C9C9C00C6C6C600C6C6C600B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00C6C6C600C6C6C600B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300CECECE00A5A5A500848484008484840042424200B5B5B500B5B5B5009494
      940042424200000000000000000000000000000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      00009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C000000
      000000000000000000000000000000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5008484840042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600CECECE00DEDEDE009C9C9C00000000000000
      000000000000000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE005252520042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000009C9C9C00DEDEDE00CECE
      CE00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363008484840042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE000000000000000000000000000000000000000000000000009C9C9C00DEDE
      DE00C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C00DEDEDE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600DEDEDE009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300848484008484840042424200B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000000000000000000000B5B5
      B500C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      63006363630084848400848484008484840084848400B5B5B500949494009494
      940042424200000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400B5B5B5009494
      9400424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A0052525200737373006363630063636300636363005A5A5A007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000052525200000000000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000007373
      73005A5A5A004A4A4A0094949400A59C9C008484840063636300737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00212121002929290000000000000000000000
      0000000000000000000000000000000000000000000000000000525252005252
      5200525252005252520052525200000000000000000000000000000000005252
      520052525200000000000000000000000000000000004A4A4A004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000007373
      7300737373007373730000000000000000000000000000000000000000005252
      520094949400BDBDBD00ADADAD00A59C9C00848484007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00BDBDBD007B7B7B0000000000000000004A4A4A00525252000000
      00000000000000000000000000000000000000000000525252005A5A5A005A5A
      5A005A5A5A005A5A5A0052525200000000000000000000000000000000008484
      84005252520000000000000000000000000000000000000000004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000007373
      7300737373007373730000000000000000000000000000000000000000007B7B
      7B00CECECE00BDBDBD00ADADAD00A59C9C00848484007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6007B7B7B007B7B7B00BDBDBD00212121002929290000000000000000005A5A
      5A00636363000000000000000000000000005A5A5A0073737300737373007373
      73005A5A5A005252520000000000000000000000000018181800848484008484
      8400848484005252520052525200000000000000000000000000000000004A4A
      4A004A4A4A000000000000000000000000000000000000000000737373007373
      73007373730073737300737373000000000000000000000000007B7B7B007B7B
      7B0084848400BDBDBD00ADADAD00A59C9C007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00000000000000000000000000000000007B7B7B007B7B7B00A59C
      9C00CECECE00BDBDBD00BDBDBD0021212100292929004A4A4A00525252000000
      0000000000007373730000000000000000005A5A5A00DEDEDE00848484003131
      3100525252000000000000000000000000001818180084848400848484008484
      8400848484008484840063636300525252000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000737373007373
      7300737373007373730073737300000000000000000000000000848484007B7B
      7B008484840084848400BDBDBD00CECECE00CECECE00CECECE00CECECE00BDBD
      BD007B7B7B000000000000000000000000007B7B7B00A59C9C00DEDEDE00D6D6
      D600CECECE00BDBDBD00BDBDBD0021212100292929004A4A4A00525252005A5A
      5A00636363000000000000000000000000005A5A5A00DEDEDE00636363005252
      52000000000000000000000000005A5A5A0084848400C6C6C600A5A5A5008484
      840084848400848484006363630052525200000000004A4A4A00000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      000073737300000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B00848484008484840084848400DEDEDE00D6D6D600D6D6D600CECECE00BDBD
      BD007B7B7B000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600CECECE00BDBDBD00FFFFFF0021212100292929004A4A4A00525252005A5A
      5A0063636300737373007B7B7B00000000005A5A5A00DEDEDE00737373006363
      630018181800000000000000000084848400EFEFEF00DEDEDE00C6C6C600A5A5
      A50084848400848484006363630052525200000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      000073737300000000000000000000000000000000007B7B7B007B7B7B008484
      84008484840084848400BDBDBD00DEDEDE00DEDEDE00D6D6D600CECECE00BDBD
      BD00848484007B7B7B0000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00BDBDBD00BDBDBD00BDBDBD004A4A4A00525252005A5A
      5A0063636300737373007B7B7B00000000005A5A5A00DEDEDE00949494007373
      73006363630052525200000000000000000084848400EFEFEF00DEDEDE00C6C6
      C600A5A5A5008484840052525200525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000073737300000000000000000000000000000000007B7B7B007B7B7B008484
      840084848400BDBDBD00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00BDBDBD000000000000000000000000007B7B7B00FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300BDBDBD00BDBDBD00BDBDBD005A5A
      5A0063636300737373007B7B7B00000000005A5A5A00DEDEDE00EFEFEF009494
      940073737300636363004A4A4A004A4A4A004A4A4A0084848400EFEFEF00DEDE
      DE00C6C6C600848484006363630052525200000000004A4A4A004A4A4A004A4A
      4A00000000004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      000073737300000000000000000000000000000000007B7B7B00848484008484
      84008484840084848400BDBDBD00DEDEDE00DEDEDE00DEDEDE005A5A5A00DEDE
      DE00848484000000000000000000000000007B7B7B00FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE007B7B7B007B7B7B000000
      0000BDBDBD00737373007B7B7B00000000005A5A5A00EFEFEF00949494004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A0084848400EFEF
      EF004A4A4A00B5B5B500636363005252520000000000737373004A4A4A000000
      000000000000000000004A4A4A00737373000000000000000000000000000000
      000073737300000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B0084848400848484008484840084848400DEDEDE00DEDEDE00848484008484
      840084848400000000000000000000000000000000007B7B7B007B7B7B00FFFF
      FF00DEDEDE00BDBDBD00D6D6D6007B7B7B007B7B7B00BDBDBD00BDBDBD000000
      0000DEDEDE000000000000000000000000005A5A5A00DEDEDE004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A008484
      84004A4A4A004A4A4A00636363005252520000000000000000004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000000000000000000000000000000000
      000073737300000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B0084848400848484008484840084848400BDBDBD00DEDEDE00DEDEDE00CECE
      CE00848484000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B00FFFFFF007B7B7B00BDBDBD00BDBDBD00BDBDBD00D6D6D600CECE
      CE00000000000000000000000000000000005A5A5A0094949400737373004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A0094949400313131000000000000000000737373004A4A
      4A00000000004A4A4A0073737300000000000000000000000000000000000000
      00007373730000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B0084848400848484008484840084848400BDBDBD00DEDEDE00CECE
      CE00848484000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B00BDBDBD00CECECE00CECECE00CECECE00D6D6
      D600CECECE00000000000000000000000000000000005A5A5A00949494007373
      73004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A007373730052525200000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000848484007B7B
      7B007B7B7B007B7B7B00848484007B7B7B008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00EFF7FF00EFF7FF00000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A005252520052525200525252005252520052525200525252005252
      5200525252005252520000000000000000000000000000000000000000007373
      73004A4A4A007373730000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B008484840084848400848484008484
      84007B7B7B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600EFF7FF00EFF7
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000000000000000
      0000737373000000000000000000000000000000000000000000000000000000
      0000848484007B7B7B007B7B7B007B7B7B00848484007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD00ADADAD00ADAD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B0000000000000000004A4A4A00525252008484
      8400636363003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018181800000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000BDBD
      BD00DEDEDE00BDBDBD007B7B7B00000000000000000000000000525252008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000737373000000000000000000000000000000
      0000000000000000000063636300DEDEDE00A59C9C0063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000525252004A4A4A0039393900181818000000
      0000000000000000000000000000000000007B7B7B00D6D6D600BDBDBD00BDBD
      BD00BDBDBD007B7B7B0000000000BDBDBD007B7B7B007B7B7B0000000000BDBD
      BD00DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000005252
      5200848484008484840039393900000000000000000000000000000000000000
      0000000000000000000073737300393939000000000000000000000000000000
      00000000000063636300DEDEDE00A59C9C00DEDEDE00A59C9C00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636363005A5A5A005A5A5A00525252005A5A5A005A5A5A002929
      2900000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD007B7B7B0000000000BDBDBD007B7B7B007B7B7B0000000000BDBD
      BD00DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000000000
      0000525252009494940039393900000000000000000000000000000000000000
      0000000000006363630039393900000000000000000000000000000000000000
      000000000000007B7B00A59C9C00DEDEDE00CECECE00D6D6D600ADADAD006363
      6300000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300292929000000000000000000000000007B7B7B00D6D6D600BDBDBD00BDBD
      BD00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00BDBDBD00BDBDBD007B7B7B00000000000000000000000000000000000000
      0000000000005252520063636300393939000000000000000000000000000000
      0000636363003939390000000000000000000000000000000000000000000000
      000063636300ADADAD00DEDEDE00CECECE00D6D6D600DEDEDE00A59C9C00DEDE
      DE006363630000000000000000000000000000000000737373007B7B7B008484
      84007B7B7B00848484007B7B7B00848484007B7B7B00848484007B7B7B008484
      84007B7B7B002929290000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD007B7B7B00000000000000000000000000000000000000
      0000000000000000000052525200636363003939390000000000000000006363
      6300393939000000000000000000000000000000000000000000000000007B7B
      7B0063636300DEDEDE00CECECE00D6D6D600DEDEDE00A59C9C00DEDEDE00A59C
      9C00BDBDBD0063636300000000000000000000000000ADADAD00848484007B7B
      7B00848484007B7B7B00848484007B7B7B00848484007B7B7B00848484007B7B
      7B00848484007B7B7B0029292900000000007B7B7B00D6D6D600BDBDBD00BDBD
      BD007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00BDBDBD00BDBDBD007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000525252006363630039393900636363003939
      3900000000000000000000000000000000000000000000000000000000007B7B
      7B0063636300CECECE00D6D6D600DEDEDE00A59C9C00DEDEDE00A59C9C00BDBD
      BD00BDBDBD00ADADAD0063636300000000000000000000000000ADADAD008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840073737300000000007B7B7B00DEDEDE00BDBDBD007B7B
      7B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000005252520063636300393939000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B0063636300ADADAD00A59C9C00DEDEDE00A59C9C00BDBDBD00BDBD
      BD00ADADAD00006363001818180000000000000000000000000000000000ADAD
      AD00848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000007B7B7B00D6D6D600BDBDBD007B7B
      7B00DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000000000
      00000000000000000000000000007B7B7B006363630039393900636363003939
      390000000000000000000000000000000000000000000000000000000000A59C
      9C00A59C9C007B7B7B0063636300DEDEDE00ADADAD00BDBDBD00BDBDBD00A59C
      9C00636363003131310000000000000000000000000000000000000000000000
      0000ADADAD008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD007B7B
      7B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000000000
      000000000000000000007B7B7B00636363003939390000000000000000006363
      630039393900000000000000000000000000000000000000000000000000A59C
      9C00ADADAD00ADADAD007B7B7B0063636300ADADAD0029949400636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD00A59C9C00949494007373730000000000000000000000
      0000000000000000000000000000000000007B7B7B00D6D6D600BDBDBD007B7B
      7B00DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00BDBDBD007B7B7B00000000000000000000000000000000000000
      00004A4A4A004A4A4A0063636300393939000000000000000000000000000000
      000063636300393939000000000000000000000000000000000094949400BDBD
      BD00ADADAD00ADADAD007B7B7B007B7B7B006363630063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD007B7B
      7B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00BDBDBD007B7B7B000000000000000000000000004A4A4A004A4A
      4A00848484006363630039393900000000000000000000000000000000000000
      0000000000006363630039393900000000000000000094949400ADADAD008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00D6D6D600BDBDBD007B7B
      7B00DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6D600DEDEDE00D6D6
      D600DEDEDE00000000007B7B7B0000000000000000004A4A4A00848484008484
      8400636363003939390000000000000000000000000000000000000000000000
      00000000000000000000737373003939390094949400A59C9C00848484009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD007B7B
      7B00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00BDBDBD007B7B7B00000000004A4A4A0084848400737373006363
      6300393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000007373730052525200525252007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF008007FFFF000000008003800100000000
      C000800100000000C00080010000000080008001000000008000800100000000
      8000800100000000C001800100000000C001800100000000E003800100000000
      F007800100000000F013800100000000C019800100000000800C800100000000
      000F800100000000080FFFFF00000000FFFFFFFFFF00FFFFFFFFFFFF8A00FFFF
      FFFFFFFF00100000FFFFFFFF00100000FC7FFFFF00000000FC7FFFFF00000000
      FC7FFFFF00000000E00FE00700000000E00FE00700000000E00FE00700000000
      FC7FFFFF00000000FC7FFFFF00000000FC7FFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000FFFFFFBFFFFFFFFFFFFF8007FFFFFFFFFFCF
      8007FE07F83F00018007FDE3E00F00018007FBF1C007000180078071C0070831
      80078051800310018003804180032A7980038041800301018001804380030279
      80048041C00700018006807FC00721F1800F807FE00F0001801F80FFF83F0001
      803F81FFFFFF0001FFFFFFFFFFFF00010000FFFFFE00FFFF000080070000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000070000000000000003000000000000000100000000
      000000000000000000000000000000000000000000000000000080000000FFFF
      0000C0010000FFFF0000E003FFFFFFFFFE3FFE3FF0078001E007E007E0030000
      80018001E001000000000000C001000000000000800080010000000080008001
      000000008000C00300000000C001C00300000000C001E00700000000E003E007
      00000000F007F00F00000000FC1FF00F00000000FC1FF81FC001C001F80FF81F
      F80FF80FF80FFC3FFFFFFFFFF80FFC7FFE3FFE3FFE3FFE3FE007E007E007E007
      8001000180018001000000010000000000000001000000000000000100000000
      0000000100000000000000010000000000000001000000000000000100000000
      000000010000000000000001000000000000000100000000C0018003C001C001
      F80FF01FF80FF80FFFFFFFFFFFFFFFFFFFFF87FFFFFFFFFF800780038003FFC3
      8007C0028003CF998000C000C3FBC79F8000C001E1FBE39F8000C003F0FFF199
      8000C003F87FF8C38000C003FC3FFC7F8007C003FC3FFE3F8007C003F87FC31F
      8007C003F0FF998F8003C003E1FB9FC7800BC001C3FB9FE3801F800C800399F3
      803F001F8003C3FFFFFF0FFFFFFFFFFFFFF8FFFF0000E001FFF0FFCF0000E001
      FFE0FFC70000E001FFC1F8030000E001FF83F8010000E001FF07F8030000E001
      E00FFFC70000E001C01FFFCF0000E001803FF3FF0000E001003FE3FF8001E001
      003FC03FC003A001003F803FC003C003003FC03FC0030007807FE3FFC003C00F
      C0FFF3FFC007ABFFE1FFFFFFC00FEFFFFC7FFFFFFFFF8001FC7F8001FFFFFFFF
      F83FFFFFF00F8001F01FFE7FF81FFFFFE00FFC3FFC3F8001C007F81FFE7F75D6
      8003F00FFFFF00000001FFFF800174160001FFFFFFFF00018003F00F800155D9
      8007F81FFFFF00008007FC3FFE7F77768003FE7FFC3F80010003FFFFF81FFFFF
      80078001F00F8001E01FFFFFFFFFFFFFFFFFF81FFF180007CFE3E007FC000007
      C7E3C003F0000007C3E38001C0010007C1E38001C0030007C0E30000C0030007
      C063000080030007C023000000010007C023000080010007C063000000000007
      C0E3000000000000C1E3800100000000C3E3800100010000C7E3C0038003F800
      CFE3E007C007FC00FFFFF81FE00FFE000000FFFFFFFFFFFF0000C7F3FF9FF3FF
      0000C7E3FF1FF1FF0000C7C3FE1FF0FFF807C783FC1FF07FF807C703F81FF03F
      E807C603F01FF01FE007C403E01FF00FE007C403E01FF00F0007C603F01FF01F
      0007C703F81FF03F0007C783FC1FF07FE007C7C3FE1FF0FFE007C7E3FF1FF1FF
      F807C7F3FF9FF3FFF807FFFFFFFFFFFFFFFFFFFFC00FFC7FFFF781F7E01FF01F
      C1E79DE3E03FC00781C7CFE3E00F80010381E7C1C00780010700F3C1C0070001
      0E00B9F780070000060081F7800300000300FFF780070000000088F780070000
      00009CF7800780010000C1F78007E0070000C9F7C007F8038001E3F7C007FE00
      C003E3F7E007FF03FFFFF7F7F00FFF8FFFFF800187FFFFFFFFFF000083FFFE7F
      FF3F0000C3FEFC3FFC1F0000E1FCF81FF00F0000F1F9F80FC0070000F8F3F007
      00030000FC67E00300010000FE0FE00180000000FF1FE001C0030000FE0FE003
      E00F0000FC67E00FF03F0000F0F3C03FF8FF0000C1F987FFFFFF000083FC0FFF
      FFFF000007FF1FFFFFFF80010FFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object dlgDetalle: TLookupDialog
    Caption = 'Detalle del Volante'
    CharCase = ecNormal
    DataSource = dsDetalle
    DataField = 'Volante'
    Columns = <
      item
        Expanded = False
        FieldName = 'Siniestro'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIL'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Trabajador'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Concepto pago'
        Title.Caption = 'Concepto'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prestacion'
        Title.Caption = 'Prestaci'#243'n'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F.Prestacion'
        Title.Caption = 'F.Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cantidad'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Motivo'
        Title.Caption = 'Estado'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Monto'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'A pagar'
        Title.Caption = 'Monto a Pagar'
        Width = 66
        Visible = True
      end>
    AutoFill = False
    ShowButtons = True
    ShowEditor = False
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 0
    MinRows = 8
    ShowExportar = True
    Top = 32
  end
  object dsDetalle: TDataSource
    DataSet = sdqDetalle
    Left = 56
    Top = 32
  end
  object sdqDetalle: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   df_volante "Volante", df_siniestro "Siniestro", df_cuil' +
        ' "CUIL",  '
      
        '         df_trabajador "Trabajador", df_conpago "Concepto pago",' +
        ' '
      
        '         df_prestacion "Prestacion", df_fechaprestacion "F.Prest' +
        'acion", '
      
        '         df_cantidad "Cantidad", df_motivo "Motivo", df_monto "M' +
        'onto", '
      '         df_montoapagar "A pagar"'
      '    FROM mdf_detallefac'
      '   WHERE df_volante = :pvolante'
      'ORDER BY df_siniestro')
    Left = 28
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pVolante'
        ParamType = ptInput
      end>
  end
  object ldgHistoria: TLookupDialog
    Caption = 'Historia de Autorizaciones M'#233'dicas'
    CharCase = ecNormal
    DataSource = dsHistoria
    DataField = 'AU_SINIESTRO'
    Columns = <
      item
        Expanded = False
        FieldName = 'AU_SINIESTRO'
        Title.Caption = 'Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_ORDEN'
        Title.Caption = 'Ord.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_RECAIDA'
        Title.Caption = 'Reca.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_NUMAUTO'
        Title.Caption = 'Num.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHASOLI'
        Title.Caption = 'F.Solicitud'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTACION'
        Title.Caption = 'Prestaci'#243'n'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO_T'
        Title.Caption = 'Grupo de Trabajo'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUGESTOR'
        Title.Caption = 'Usuario gestor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_USUAPRO'
        Title.Caption = 'Usuario Apro.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHAPRO'
        Title.Caption = 'Fecha de Apobaci'#243'n'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 200
        Visible = True
      end>
    AutoFill = False
    ShowButtons = False
    ShowEditor = False
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 0
    MinRows = 8
    OnTitleClick = ldgHistoriaTitleClick
    BottomControl = Sb_BarraDeEstado
    ShowExportar = True
    Top = 60
  end
  object sdqHistoria: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT   au_siniestro, au_orden, au_recaida, au_numauto, au_fech' +
        'asoli, tb_descripcion, '
      
        '         ca_descripcion prestador, pr_descripcion prestacion, gp' +
        '_nombre grupo_t, '
      
        '         iif_char(au_estado, '#39'P'#39', au_observaciones, au_detalle) ' +
        'observaciones,'
      
        '         au_usuapro, au_fechapro, siniestro.get_usuariogestor(au' +
        '_idexpediente) usugestor'
      
        '    FROM sau_autorizaciones, ctb_tablas, cpr_prestador, mpr_pres' +
        'taciones, mgp_gtrabajo'
      
        '   WHERE iif_char(au_estado, '#39'P'#39', au_identifprestador, au_identi' +
        'fapro) = ca_identificador(+)'
      
        '     AND iif_char(au_estado, '#39'P'#39', au_pressol, au_presapro) = pr_' +
        'codigo(+)'
      '     AND au_trabajo = gp_codigo(+)'
      '     AND tb_clave = '#39'MUAUT'#39
      '     AND tb_codigo = au_estado'
      '     AND au_siniestro = :psiniestro'
      '     AND au_orden = :porden'
      '     AND au_recaida = :precaida'
      'ORDER BY au_numauto'
      '')
    Left = 28
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pSiniestro'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pOrden'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pRecaida'
        ParamType = ptInput
      end>
    object sdqHistoriaAU_SINIESTRO: TFloatField
      FieldName = 'AU_SINIESTRO'
      Required = True
    end
    object sdqHistoriaAU_ORDEN: TFloatField
      FieldName = 'AU_ORDEN'
      Required = True
    end
    object sdqHistoriaAU_RECAIDA: TFloatField
      FieldName = 'AU_RECAIDA'
      Required = True
    end
    object sdqHistoriaAU_NUMAUTO: TFloatField
      FieldName = 'AU_NUMAUTO'
      Required = True
    end
    object sdqHistoriaAU_FECHASOLI: TDateTimeField
      FieldName = 'AU_FECHASOLI'
      Required = True
    end
    object sdqHistoriaTB_DESCRIPCION: TStringField
      FieldName = 'TB_DESCRIPCION'
      Size = 150
    end
    object sdqHistoriaPRESTADOR: TStringField
      FieldName = 'PRESTADOR'
      Size = 150
    end
    object sdqHistoriaPRESTACION: TStringField
      FieldName = 'PRESTACION'
      Size = 50
    end
    object sdqHistoriaGRUPO_T: TStringField
      FieldName = 'GRUPO_T'
      Size = 30
    end
    object sdqHistoriaOBSERVACIONES: TStringField
      FieldName = 'OBSERVACIONES'
      Size = 4000
    end
    object sdqHistoriaAU_USUAPRO: TStringField
      FieldName = 'AU_USUAPRO'
    end
    object sdqHistoriaAU_FECHAPRO: TDateTimeField
      FieldName = 'AU_FECHAPRO'
    end
    object sdqHistoriaUSUGESTOR: TStringField
      FieldName = 'USUGESTOR'
      Size = 4000
    end
  end
  object dsHistoria: TDataSource
    DataSet = sdqHistoria
    Left = 56
    Top = 60
  end
  object ldgFirmas: TLookupDialog
    Caption = 'Historia de Autorizaciones M'#233'dicas'
    CharCase = ecNormal
    DataSource = dsFirmas
    DataField = 'USUARIO'
    Columns = <
      item
        Expanded = False
        FieldName = 'AU_SINIESTRO'
        Title.Caption = 'Siniestro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_ORDEN'
        Title.Caption = 'Ord.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_RECAIDA'
        Title.Caption = 'Reca.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_NUMAUTO'
        Title.Caption = 'Num.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TB_DESCRIPCION'
        Title.Caption = 'Estado'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHASOLI'
        Title.Caption = 'F.Solicitud'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTADOR'
        Title.Caption = 'Prestador'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRESTACION'
        Title.Caption = 'Prestaci'#243'n'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPO_T'
        Title.Caption = 'Grupo de Trabajo'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACIONES'
        Title.Caption = 'Observaciones'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_USUAPRO'
        Title.Caption = 'Usuario Apro.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AU_FECHAPRO'
        Title.Caption = 'Fecha de Apobaci'#243'n'
        Width = 60
        Visible = True
      end>
    AutoFill = False
    ShowButtons = False
    ShowEditor = False
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 0
    MinRows = 8
    OnTitleClick = ldgHistoriaTitleClick
    ShowExportar = True
    Top = 88
  end
  object sdqFirmas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      'SELECT DF_CODFIRMA, '
      '               INITCAP(DF_USUARIO) USUARIO, '
      '               INITCAP(DF_CARACTER) CARACTER'
      'FROM CDF_FIRMASCARTASDOC'
      'WHERE SUBSTR(DF_ESPECIAL,6,1) = '#39'S'#39
      'AND DF_FBAJA IS NULL'
      'ORDER BY DF_USUARIO')
    Left = 28
    Top = 88
    object sdqFirmasDF_CODFIRMA: TStringField
      FieldName = 'DF_CODFIRMA'
      Required = True
      Size = 5
    end
    object sdqFirmasUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 50
    end
    object sdqFirmasCARACTER: TStringField
      FieldName = 'CARACTER'
      Size = 60
    end
  end
  object dsFirmas: TDataSource
    DataSet = sdqFirmas
    Left = 56
    Top = 88
  end
  object ilByN: TImageList
    Top = 144
    Bitmap = {
      494C010129002C00280010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600A5A5A500C6C6C600C6C6C600A5A5A500C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600A5A5A500A5A5A500A5A5A500A5A5A500C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600737373007373
      7300737373007373730073737300737373007373730073737300737373007373
      73007373730073737300C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004242420073737300848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      420073737300C6C6C600B5B5B50042424200000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242007373
      7300848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242007373
      7300A5A5A500C6C6C600424242000000000000000000000000005A5A5A005A5A
      5A005A5A5A00FFFFFF0000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000005A5A
      5A00737373008484840000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004242420073737300C6C6
      C600B5B5B5004242420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004242420073737300A5A5
      A500B5B5B5004242420000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00FFFFFF00000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000007373
      7300B5B5B5008484840084848400000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420073737300A5A5A500C6C6
      C600424242000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004242420073737300A5A5A500B5B5
      B500424242000000000000000000000000000000000000000000000000000000
      00005A5A5A005A5A5A005A5A5A00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500B5B5B50084848400949494000000000000000000000000000000
      0000B5B5B5000000000000000000000000000000000000000000000000000000
      00004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200000000000000000000000000000000000000000000000000000000004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A005A5A5A00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C0000000000000000000000
      0000B5B5B5000000000000000000000000000000000000000000000000004242
      4200CECECE00CECECE00D6D6D600C6C6C6004242420084848400424242000000
      000000000000000000000000000000000000000000000000000042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A005A5A5A005A5A5A00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      0000B5B5B500000000000000000000000000000000000000000042424200CECE
      CE00CECECE00D6D6D600D6D6D600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF005A5A5A005A5A5A005A5A5A00000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600CECECE00DEDEDE009C9C9C000000000000000000000000000000
      0000CECECE00000000000000000000000000000000000000000042424200CECE
      CE00F7F7F700E7E7E700D6D6D600C6C6C600C6C6C60042424200000000000000
      00000000000000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF005A5A5A005A5A5A005A5A5A0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600CECECE00DEDEDE009C9C9C00000000000000000000000000000000000000
      0000CECECE00000000000000000000000000000000000000000042424200D6D6
      D600D6D6D600D6D6D600C6C6C600A5A5A500A5A5A50042424200000000000000
      00000000000000000000000000000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF005A5A5A005A5A5A005A5A5A000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600DEDEDE009C9C9C0000000000000000000000000000000000000000000000
      0000CECECE00000000000000000000000000000000000000000042424200B5B5
      B500B5B5B500B5B5B500C6C6C600848484008484840042424200000000000000
      00000000000000000000000000000000000042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF005A5A5A005A5A5A005A5A5A00000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      0000CECECE000000000000000000000000000000000000000000000000004242
      4200B5B5B500C6C6C60094949400848484004242420000000000000000000000
      00000000000000000000000000000000000042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A50042424200000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      0000000000005A5A5A000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000CECECE000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242000000000000000000000000000000
      0000000000000000000000000000000000000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C600848484004242420000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF005A5A5A005A5A
      5A005A5A5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400848484004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00E7E7E700D6D6
      D600D6D6D600D6D6D600848484004A4A4A004A4A4A004A4A4A00000000004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000848484004A4A4A00E7E7
      E700D6D6D600D6D6D600CECECE00C6C6C600C6C6C6004A4A4A004A4A4A006363
      6300636363006363630063636300636363000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000000000005A5A
      5A005A5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A005A5A5A00000000000000000000000000000000000000
      00000000000000000000000000000000000084848400B5B5B500B5B5B5004A4A
      4A00E7E7E700E7E7E700DEDEDE00DEDEDE00CECECE00CECECE004A4A4A008484
      8400848484008484840084848400848484000000000000000000000000005A5A
      5A00000000000000000000000000000000000000000000000000848484007373
      73005A5A5A000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400737373005A5A5A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0073737300848484000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600525252005252
      520084848400E7E7E700E7E7E700DEDEDE00D6D6D600CECECE004A4A4A008484
      8400848484008484840084848400848484000000000000000000000000008484
      840000000000000000000000000000000000000000008484840084848400B5B5
      B500737373000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400B5B5B50073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073737300B5B5B500848484008484840000000000000000000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C600636363006363630063636300636363006363630000000000B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500000000000000000000000000B5B5
      B500000000000000000000000000000000009494940084848400B5B5B500B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      0000000000009494940084848400B5B5B500B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500B5B5B5008484840094949400000000000000
      00000000000000000000000000000000000084848400C6C6C600636363006363
      63006363630063636300B5B5B500000000000000000000000000000000006363
      630063636300636363006363630063636300000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C009C9C9C00C6C6C600C6C6C600B5B5
      B500B5B5B5000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00C6C6C600C6C6C600B5B5B500B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500C6C6C600C6C6C6009C9C9C009C9C9C000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C600E7E7E700B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B5000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6
      C600B5B5B5000000000000000000000000000000000000000000000000000000
      00009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500C6C6C600C6C6C600CECECE00DEDEDE009C9C9C000000
      00000000000000000000000000000000000084848400C6C6C600848484008484
      840084848400C6C6C600B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000009C9C9C00DEDEDE00CECECE00C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00DEDEDE00CECECE00C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600CECECE00DEDEDE009C9C9C00000000000000
      00000000000000000000000000000000000084848400E7E7E700C6C6C600E7E7
      E700C6C6C6008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000009C9C9C00DEDEDE00CECE
      CE00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00DEDEDE00CECECE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600CECECE00DEDEDE009C9C9C0000000000000000000000
      00000000000000000000000000000000000084848400E7E7E700E7E7E700E7E7
      E700E7E7E7008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE000000000000000000000000000000000000000000000000009C9C9C00DEDE
      DE00C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C00DEDEDE00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600DEDEDE009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE0000000000000000000000000000000000000000000000000000000000B5B5
      B500C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5B500C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300949494006363630000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840000000000000000008484
      84000000000000000000000000000000000042424200CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600B5B5B500B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000636363009494940063636300000000000000000084848400848484008484
      84008484840084848400C6C6C600C6C6C6008484840000000000C6C6C6008484
      84008484840000000000848484000000000042424200D6D6D600EFEFEF00EFEF
      EF00DEDEDE00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600C6C6C6009C9C9C00000000008484000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848400000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500636363009494940063636300000000000000000084848400C6C6C6008484
      84008484840084848400FFFFFF00FFFFFF008484840000000000C6C6C6008484
      840084848400848484000000000000000000424242005A5A5A00CECECE00DEDE
      DE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600B5B5B5005A5A5A000000000084848400B5B5B500EFEFEF00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      C600C6C6C600B5B5B500B5B5B500848484000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C60063636300B5B5
      B500636363009494940063636300000000000000000084848400C6C6C6008484
      8400FFFFFF00C6C6C60084848400FFFFFF008484840000000000848484008484
      84008484840084848400848484000000000042424200E7E7E7005A5A5A00C6C6
      C600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00B5B5B5005A5A5A00B5B5B5000000000084848400EFEFEF00B5B5B500EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C600B5B5B500B5B5B500848484000000000084848400E7E7E7005252
      5200525252005252520052525200525252005252520052525200636363006363
      630063636300949494006363630000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF00C6C6C600FFFFFF008484840000000000848484008484
      8400C6C6C60084848400848484000000000042424200E7E7E700DEDEDE005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00E7E7E700C6C6C6000000000084848400EFEFEF00EFEFEF00B5B5
      B500E7E7E700D6D6D600C6C6C600A5A5A500B5B5B500DEDEDE00DEDEDE00D6D6
      D600B5B5B500D6D6D600B5B5B500848484000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600636363009C9C
      9C0063636300636363006363630000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000000000848484008484
      8400C6C6C600C6C6C600848484000000000042424200E7E7E7005A5A5A00DEDE
      DE00DEDEDE00DEDEDE00C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00DEDEDE005A5A5A00C6C6C6000000000084848400EFEFEF00EFEFEF00E7E7
      E700B5B5B500C6C6C600B5B5B500D6D6D600D6D6D600A5A5A500DEDEDE00B5B5
      B500D6D6D600D6D6D600B5B5B500848484000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300636363009C9C
      9C00B5B5B500636363000000000000000000000000008484840084848400C6C6
      C600FFFFFF00FFFFFF0084848400FFFFFF008484840000000000848484008484
      840084848400848484008484840000000000424242005A5A5A0000000000EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00DEDE
      DE00EFEFEF00000000005A5A5A000000000084848400E7E7E700EFEFEF00D6D6
      D600C6C6C600B5B5B500DEDEDE00DEDEDE00DEDEDE00DEDEDE00A5A5A500DEDE
      DE00CECECE00D6D6D600B5B5B500848484000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600636363006363
      6300636363006363630063636300000000000000000084848400C6C6C6008484
      8400C6C6C6008484840084848400FFFFFF008484840000000000C6C6C600C6C6
      C60084848400C6C6C600848484000000000042424200B5B5B50000000000EFEF
      EF00DEDEDE00DEDEDE00C6C6C600DEDEDE00DEDEDE00C6C6C600C6C6C600DEDE
      DE00EFEFEF0000000000B5B5B5000000000084848400E7E7E700DEDEDE00C6C6
      C600B5B5B500E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00A5A5
      A500D6D6D600DEDEDE00B5B5B500848484000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B500000000000000000000000000000000000000000084848400FFFFFF008484
      84008484840084848400FFFFFF00C6C6C6008484840000000000C6C6C600C6C6
      C600C6C6C600C6C6C6008484840000000000000000008484840000000000EFEF
      EF00DEDEDE00C6C6C600C6C6C600C6C6C600C6C6C600DEDEDE00C6C6C600DEDE
      DE00EFEFEF0000000000212121000000000084848400E7E7E700D6D6D600B5B5
      B500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E700A5A5A500D6D6D600C6C6C600848484000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B500000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00848484008484840084848400848484008484840084848400000000008484
      8400C6C6C600C6C6C6008484840000000000000000000000000021212100EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF0000000000000000000000000084848400DEDEDE00B5B5B500F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00B5B5B500B5B5B500848484000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B500000000000000000000000000000000000000000084848400848484008484
      840084848400848484008484840084848400C6C6C600C6C6C600848484008484
      840084848400000000000000000000000000000000000000000000000000EFEF
      EF00DEDEDE00C6C6C600C6C6C600EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6E7
      E700DEDEDE0000000000000000000000000084848400B5B5B500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700A5A5A500848484000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      000000000000000000000000000000000000000000008484840084848400C6C6
      C600C6C6C600C6C6C60084848400848484008484840084848400848484008484
      8400C6C6C600848484008484840000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00C6C6C6004A4A
      4A004A4A4A000000000000000000000000008484000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848400000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400C6C6C60084848400848484008484840084848400C6C6C6008484
      840084848400848484000000000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF0084848400EFEF
      EF00DEDEDE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400DEDE
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00525252006363
      6300424242003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A5A5A005A5A
      5A005A5A5A0052525200737373006363630063636300636363005A5A5A007373
      7300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A5A00000000000000
      000000000000000000000000000000000000000000004A4A4A00525252008484
      8400636363004242420063636300636363006363630063636300636363006363
      6300636363003939390000000000000000000000000052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000007373
      73005A5A5A004A4A4A0094949400A5A5A5008484840063636300737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A0084848400525252000000
      0000000000000000000000000000000000000000000000000000525252008484
      84008484840084848400B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A500737373003939390073737300000000009C9C9C00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60052525200000000000000000000000000000000005252
      520094949400C6C6C600B5B5B500A5A5A5008484840084848400000000000000
      0000000000000000000000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B5005A5A5A00848484006363630052525200B5B5
      B500000000000000000000000000000000000000000000000000212121005252
      5200848484008484840042424200636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C007373730042424200000000009C9C9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60052525200000000000000000000000000000000008484
      8400CECECE00C6C6C600B5B5B500A5A5A5008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C6005A5A5A008484840063636300C6C6C600636363005252
      520000000000000000000000000000000000000000003939390063636300B5B5
      B500525252009494940042424200FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600636363004242420039393900000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE0084848400C6C6C60084848400CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000848484008484
      840084848400C6C6C600B5B5B500A5A5A5008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400E7E7E7005252
      5200525252005252520063636300636363005252520052525200636363005252
      520000000000000000000000000000000000000000003939390063636300B5B5
      B500D6D6D6005252520063636300424242006363630063636300FFFFFF00F7F7
      F70063636300424242006363630039393900000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E700636363006363630063636300E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000000000000848484008484
      84008484840084848400C6C6C600CECECE00CECECE00CECECE00CECECE00C6C6
      C600848484000000000000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E7006363
      630052525200000000000000000000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700525252006363630042424200FFFFFF00FFFFFF006363
      630042424200B5B5B5006363630039393900000000009C9C9C00F7F7F700CECE
      CE00CECECE006363630094949400C6C6C6009494940063636300CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000084848400848484008484
      8400848484008484840084848400DEDEDE00D6D6D600D6D6D600CECECE00C6C6
      C600848484000000000000000000000000000000000084848400E7E7E7006363
      6300636363006363630063636300636363006363630063636300C6C6C6006363
      63005252520000000000000000000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300525252006363630042424200636363004242
      4200C6C6C6009C9C9C004A4A4A0000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E70094949400E7E7E7009494940063636300CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000084848400848484008484
      84008484840084848400C6C6C600DEDEDE00DEDEDE00D6D6D600CECECE00C6C6
      C600848484008484840000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B500636363005252520000000000000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF0063636300525252006363630042424200CECE
      CE00B5B5B500848484003939390000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE00636363006363630063636300CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000084848400848484008484
      840084848400C6C6C600DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00C6C6C6000000000000000000000000000000000084848400E7E7E7007373
      7300737373007373730073737300737373007373730073737300C6C6C600B5B5
      B500636363005252520000000000000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600848484006363630042424200636363004242
      42009C9C9C00393939000000000000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE006363630094949400E7E7E70094949400E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000084848400848484008484
      84008484840084848400C6C6C600DEDEDE00DEDEDE00DEDEDE005A5A5A00DEDE
      DE00848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700B5B5
      B50000000000636363005A5A5A00000000000000000000000000000000000000
      000039393900636363008484840063636300424242009C9C9C009C9C9C006363
      630042424200000000000000000000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE006363630094949400C6C6C6009494940063636300CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000084848400848484008484
      840084848400848484008484840084848400DEDEDE00DEDEDE00848484008484
      8400848484000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E700B5B5
      B500000000000000000063636300525252000000000000000000000000000000
      00004A4A4A004A4A4A0063636300424242005A5A5A005A5A5A00313131000000
      000063636300424242000000000000000000000000009C9C9C00F7F7F700E7E7
      E700CECECE00E7E7E700636363006363630063636300E7E7E700CECECE00E7E7
      E700F7F7F700C6C6C60052525200000000000000000084848400848484008484
      840084848400848484008484840084848400C6C6C600DEDEDE00DEDEDE00CECE
      CE00848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      00000000000000000000000000006363630000000000000000004A4A4A004A4A
      4A008484840063636300424242007373730094949400848484004A4A4A000000
      000000000000636363004242420000000000000000009C9C9C00F7F7F700CECE
      CE00CECECE00CECECE0084848400C6C6C60084848400CECECE00CECECE00CECE
      CE00F7F7F700C6C6C60052525200000000000000000000000000848484008484
      84008484840084848400848484008484840084848400C6C6C600DEDEDE00CECE
      CE00848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      000000000000000000000000000000000000000000004A4A4A00848484008484
      8400636363004242420094949400B5B5B500A5A5A500DEDEDE00848484003939
      390000000000000000007373730042424200000000009C9C9C00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60052525200000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000004A4A4A0084848400737373006363
      6300424242006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A0000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000007373730052525200525252007373
      7300000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393939003939390039393900393939003939390039393900393939003939
      3900393939000000000000000000000000004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003939
      3900737373006363630063636300636363006363630063636300636363006363
      6300636363003939390000000000000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600D6D6D600D6D6D600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000004A4A
      4A00A5A5A500A5A5A500B5B5B500FFFFFF0063636300FFFFFF00B5B5B500B5B5
      B500A5A5A5007373730039393900000000004A4A4A00A5A5A500A5A5A5004A4A
      4A00C6C6C600C6C6C600C6C6C600D6D6D6004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE004A4A4A000000000000000000000000000000000063636300CECE
      CE00949494009494940094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      630094949400636363000000000000000000000000000000000021212100A5A5
      A500C6C6C600DEDEDE00FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B5009C9C9C0039393900000000004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A0000000000000000000000000063636300CECE
      CE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5B5009494
      9400B5B5B5009494940000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      000063636300949494006363630000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F70063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C600B5B5B50063636300393939004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C9C00B5B5
      B500848484000000000094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063636300949494006363630000000000000000003939390063636300B5B5
      B500D6D6D600F7FFFF00FFFFFF00FFFFFF006363630063636300FFFFFF00F7F7
      F700CECECE00B5B5B50063636300393939004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00CECE
      CE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5B5009C9C
      9C00B5B5B5000000000094949400000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5000000000000000000636363000000
      000063636300949494006363630000000000000000003939390063636300B5B5
      B500D6D6D600F7F7F700FFFFFF006363630063636300FFFFFF00FFFFFF00EFEF
      EF00D6D6D600B5B5B50063636300393939004A4A4A00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00C6C6C600B5B5
      B500CECECE00B5B5B500CECECE00B5B5B500C6C6C600B5B5B5009C9C9C00B5B5
      B50000000000B5B5B50094949400000000000000000084848400C6C6C6005252
      5200525252005252520052525200B5B5B5000000000000000000636363006363
      63006363630094949400636363000000000000000000000000004A4A4A00A5A5
      A500CECECE00EFEFEF0063636300FFFFFF0063636300FFFFFF0063636300E7E7
      E700C6C6C6009C9C9C004A4A4A00000000004A4A4A00A5A5A500A5A5A5004A4A
      4A004A4A4A00A5A5A500A5A5A5004A4A4A004A4A4A00A5A5A500A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A000000000063636300CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00000000009494940094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363009C9C
      9C00636363006363630063636300000000000000000000000000393939008484
      8400B5B5B500D6D6D600FFFFFF00636363006363630063636300FFFFFF00CECE
      CE00B5B5B500848484003939390000000000000000004A4A4A00A5A5A5004A4A
      4A00CECECE004A4A4A00A5A5A5004A4A4A00CECECE004A4A4A00A5A5A5004A4A
      4A00CECECE00CECECE004A4A4A00000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      63009C9C9C00B5B5B50094949400000000000000000084848400C6C6C6006363
      6300636363006363630063636300B5B5B5000000000000000000636363009C9C
      9C00B5B5B5006363630000000000000000000000000000000000000000004242
      42009C9C9C00B5B5B500C6C6C600FFFFFF0063636300FFFFFF00CECECE00B5B5
      B5009C9C9C0039393900000000000000000000000000000000004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A004A4A4A00CECECE00CECECE004A4A4A004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500B5B5B5009C9C
      9C00B5B5B5009C9C9C0094949400000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700B5B5B5000000000000000000636363006363
      6300636363006363630063636300000000000000000000000000000000000000
      000039393900636363009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C007373
      7300393939000000000000000000000000000000000000000000000000004A4A
      4A00CECECE00CECECE00CECECE004A4A4A00CECECE00CECECE00CECECE004A4A
      4A00CECECE00CECECE004A4A4A00000000000000000063636300CECECE00C6C6
      C600B5B5B500C6C6C600B5B5B500C6C6C600B5B5B500E7E7E700CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000084848400C6C6C6008484
      84008484840084848400C6C6C600B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313100636363005A5A5A005A5A5A00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A00CECECE004A4A4A00000000004A4A4A00CECECE004A4A4A000000
      00004A4A4A00CECECE004A4A4A00000000000000000063636300CECECE00B5B5
      B500C6C6C600B5B5B500CECECE00B5B5B5009C9C9C0063636300636363006363
      6300636363006363630063636300636363000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A007373730094949400848484004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A0000000000000000004A4A4A004A4A4A000000
      0000000000004A4A4A004A4A4A0000000000000000000000000063636300CECE
      CE00CECECE00CECECE00CECECE009C9C9C006363630000000000000000000000
      0000000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E70084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003939390094949400B5B5B500A5A5A500DEDEDE00848484003939
      3900000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A000000000000000000000000004A4A4A000000
      000000000000000000004A4A4A00000000000000000000000000000000006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630084848400C6C6C600B5B5B500B5B5B500848484004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630039393900636363003939390063636300393939006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600EFEF
      EF00D6D6D600B5B5B500C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363005A5A5A0000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      94009C9C9C009C9C9C00F7F7F700B5B5B5009C9C9C009C9C9C00B5B5B500FFFF
      FF00B5B5B500949494009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000006363630084848400636363000000
      0000000000000000000000000000000000006363630073737300737373007373
      730063636300C6C6C600636363005A5A5A005A5A5A0000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0084848400848484008484
      84008484840084848400FFFFFF0084848400C6C6C60094949400949494009C9C
      9C009494940094949400F7F7F700B5B5B5009494940094949400CECECE00DEDE
      DE00949494009C9C9C0094949400B5B5B50084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600636363009494940073737300636363000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400C6C6C600B5B5B500A5A5A500848484005A5A5A00A5A5A500949494006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400949494009C9C9C00F7F7F700B5B5B5009C9C9C0094949400F7F7F700B5B5
      B500949494009C9C9C009C9C9C009C9C9C0084848400F7F7F700848484008484
      84008484840084848400636363009C9C9C0073737300C6C6C600737373006363
      630000000000000000000000000000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50084848400848484005A5A5A005A5A5A00C6C6C6006363
      63005A5A5A0084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400D6D6D600C6C6C600CECECE00CECE
      CE00B5B5B50094949400F7F7F700C6C6C600B5B5B500DEDEDE00DEDEDE009494
      9400949494009C9C9C00949494009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F7007373730073737300F7F7F700C6C6C600737373006363
      6300000000000000000000000000000000000000000000000000848484008484
      8400C6C6C6008484840084848400848484005A5A5A00C6C6C600B5B5B500A5A5
      A5008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840084848400FFFFFF0084848400F7F7F700CECECE00C6C6C600CECE
      CE00F7F7F700D6D6D600F7F7F700DEDEDE00DEDEDE00EFEFEF00D6D6D600B5B5
      B500F7F7F7009C9C9C00949494009C9C9C0084848400F7F7F700A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000000000000084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400B5B5B500A5A5A5008484
      84008484840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C600949494009C9C9C009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400C6C6C600F7F7
      F700F7F7F7009C9C9C0094949400B5B5B50084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C600000000007373
      7300636363000000000000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600D6D6D600C6C6C60084848400A5A5A500848484008484
      84008484840000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      940094949400EFEFEF00FFFFFF00B5B5B500949494009494940094949400FFFF
      FF00F7F7F700B5B5B5009C9C9C009C9C9C0084848400F7F7F700949494009494
      940094949400949494009494940094949400F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000008484840084848400848484008484
      8400C6C6C600D6D6D600CECECE00CECECE00C6C6C60084848400D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C60094949400949494009494
      9400B5B5B500FFFFFF00FFFFFF00B5B5B5009494940094949400B5B5B500FFFF
      FF00F7F7F7009C9C9C009C9C9C009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600737373006363630000000000000000008484840084848400848484008484
      840084848400D6D6D600D6D6D6005A5A5A0084848400D6D6D600D6D6D600D6D6
      D600C6C6C60084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF008484840084848400FFFF
      FF008484840084848400FFFFFF0084848400C6C6C6009494940094949400C6C6
      C600F7F7F700C6C6C600FFFFFF00C6C6C600C6C6C600CECECE00EFEFEF00DEDE
      DE00F7F7F7009C9C9C00949494009C9C9C0084848400F7F7F700B5B5B500B5B5
      B500B5B5B500C6C6C600F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000007373730063636300000000008484840084848400848484008484
      840084848400C6C6C600D6D6D600D6D6D60084848400C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60084848400000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400C6C6C600B5B5B500EFEFEF00EFEF
      EF00B5B5B5009C9C9C00CECECE00D6D6D600D6D6D600CECECE00C6C6C6009C9C
      9C00F7F7F7009C9C9C0094949400B5B5B50084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000073737300636363008484840084848400848484008484
      8400848484008484840084848400C6C6C600C6C6C60084848400D6D6D600D6D6
      D6005A5A5A0084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840084848400D6D6D600F7F7F700C6C6C6009494
      94009C9C9C0094949400949494009C9C9C00949494009C9C9C009C9C9C009C9C
      9C00F7F7F7009C9C9C00949494009C9C9C0084848400F7F7F7009C9C9C009C9C
      9C00C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000737373000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C600D6D6
      D600D6D6D60084848400000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C60084848400FFFFFF00C6C6C600949494009494
      9400949494009C9C9C0094949400949494009494940094949400949494009494
      9400F7F7F7009C9C9C009C9C9C009C9C9C0084848400F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400C6C6C600C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400FFFFFF00C6C6C6009C9C9C009494
      9400949494009C9C9C00949494009C9C9C00949494009C9C9C009C9C9C009494
      9400F7F7F700B5B5B5009C9C9C009C9C9C008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400DEDEDE00F7F7F700B5B5B5009C9C
      9C00B5B5B500B5B5B50094949400949494009C9C9C00D6D6D600D6D6D600CECE
      CE00FFFFFF00D6D6D600D6D6D600DEDEDE00000000000000000084848400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600CECECE00F7F7F700E7E7
      E700F7F7F700CECECE009C9C9C009C9C9C009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      0000424242007373730084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400FFFFFF00DEDEDE009494
      940094949400FFFFFF0094949400949494009494940094949400FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004242
      420073737300C6C6C600B5B5B5004242420084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00CECECE009C9C9C00424242007373
      7300A5A5A500C6C6C600424242000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000084848400FFFFFF00FFFFFF00A5A5
      A500A5A5A500FFFFFF00A5A5A500A5A5A500A5A5A500A5A5A500FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00CECECE009C9C9C00CECECE004242420073737300A5A5
      A500B5B5B50042424200000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400FFFFFF00DEDEDE00FFFF
      FF00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FFFF
      FF00CECECE009C9C9C00CECECE009C9C9C004242420073737300A5A5A500B5B5
      B5004242420000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400FFFFFF00FFFFFF00B5B5
      B500B5B5B500FFFFFF00B5B5B500B5B5B500B5B5B500B5B5B500FFFFFF00CECE
      CE00000000000000000000000000000000000000000031313100DEDEDE004242
      42004242420042424200424242004242420084848400A5A5A500B5B5B5004242
      4200FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A00000000004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A000000
      00004A4A4A0000000000000000004A4A4A0084848400FFFFFF00FFFFFF00DEDE
      DE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00DEDEDE00FFFFFF00CECE
      CE000808080000000000000000000000000000000000FFFFFF0042424200CECE
      CE00D6D6D600C6C6C600C6C6C600424242004242420084848400424242009C9C
      9C00CECECE00C6C6C600000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484008484840084848400FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A009C9C9C009C9C9C009C9C
      9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C9C009C9C9C004A4A4A009C9C
      9C009C9C9C004A4A4A004A4A4A000000000084848400FFFFFF00CECECE00CECE
      CE00DEDEDE00FFFFFF00DEDEDE00CECECE0000000000CECECE00DEDEDE00CECE
      CE00000000000000000000000000000000000000000042424200CECECE00D6D6
      D600D6D6D600C6C6C600C6C6C600C6C6C6004242420042424200CECECE009C9C
      9C009C9C9C00FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600848484004A4A4A00000000004A4A4A000000
      00004A4A4A00000000004A4A4A000000000000000000000000004A4A4A000000
      0000000000004A4A4A004A4A4A000000000084848400FFFFFF00003100000031
      0000CECECE00FFFFFF00CECECE0000310000CECECE0000000000CECECE00CECE
      CE000000000000000000000000000000000042424200CECECE00F7F7F700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C600424242009C9C9C00CECE
      CE009C9C9C00CECECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600848484004A4A4A004A4A4A009C9C9C004A4A
      4A004A4A4A009C9C9C009C9C9C004A4A4A009C9C9C004A4A4A009C9C9C009C9C
      9C004A4A4A009C9C9C009C9C9C004A4A4A0084848400FFFFFF009C9C9C00D6D6
      D60000310000CECECE0000310000CECECE0094949400CECECE00000000000000
      00000808080000000000080808000000000042424200D6D6D600E7E7E700E7E7
      E700D6D6D600C6C6C600C6C6C600C6C6C600C6C6C60042424200CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600848484004A4A4A0000000000000000000000
      00004A4A4A000000000000000000000000004A4A4A0000000000000000000000
      00004A4A4A0000000000000000004A4A4A0084848400FFFFFF00FFFFFF009C9C
      9C00D6D6D60000310000CECECE0094949400CECECE00949494009C9C9C009C9C
      9C009C9C9C00000000009C9C9C009C9C9C0042424200D6D6D600D6D6D600D6D6
      D600C6C6C600C6C6C600C6C6C600A5A5A500A5A5A50042424200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000008484840084848400848484008484
      84009C9C9C00D6D6D60000310000CECECE0094949400C6C6C600C6C6C600C6C6
      C6009C9C9C009C9C9C00B5B5B500B5B5B50042424200C6C6C600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C60084848400A5A5A5004242420094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00848484008484
      840084848400FFFFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00D6D6D60000310000E7E7E700E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000042424200B5B5B500B5B5
      B500C6C6C600C6C6C600C6C6C6008484840042424200DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60084848400000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFFFFF00E7E7E700E7E7E700E7E7
      E700E7E7E7009C9C9C00CECECE00CECECE00000000000000000042424200C6C6
      C600C6C6C6009494940094949400424242008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C00FFFFFF009C9C9C009C9C9C000000000000000000000000004242
      4200424242004242420042424200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000006363630063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600292929003131310000000000000000000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00949494009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00C6C6C6008484840000000000000000004A4A4A00525252000000
      0000000000000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A5009494
      9400949494009494940094949400636363000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000DEDEDE00D6D6
      D6008484840084848400C6C6C600292929003131310000000000000000005A5A
      5A00636363000000000000000000000000009494940094949400949494009494
      94009494940094949400949494009494940063636300CECECE00A5A5A500A5A5
      A500949494009494940094949400636363000000000000000000000000008484
      8400E7E7E7005252520052525200525252005252520052525200525252005252
      5200C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600000000000000
      000000000000000000000000000000000000000000008484840084848400A5A5
      A500CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252000000
      0000000000007373730000000000000000000000000000000000000000000000
      000000000000E7E7E700E7E7E700E7E7E70063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7005252
      5200525252005252520000000000000000000000000000000000000000005A5A
      5A005A5A5A005A5A5A00000000006363630084848400A5A5A500DEDEDE00D6D6
      D600CECECE00C6C6C600C6C6C60029292900313131004A4A4A00525252005A5A
      5A00636363000000000000000000000000000000000000000000000000000000
      00000000000063636300636363006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7006363630063636300636363006363630063636300636363006363
      6300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000000000008484840084848400848484006363
      63006363630063636300000000008484840084848400FFFFFF00DEDEDE00D6D6
      D600CECECE00C6C6C600FFFFFF0029292900313131004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      63000000000084848400848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7006363
      6300636363006363630000000000949494000000000000000000B5B5B500B5B5
      B5008484840084848400000000009494940084848400FFFFFF00DEDEDE00D6D6
      D600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C6004A4A4A00525252005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300A5A5A50084848400848484008484840063636300CECECE0042424200A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E7007373730073737300737373007373730073737300737373007373
      7300C6C6C600B5B5B50000000000000000000000000084848400E7E7E700C6C6
      C600E7E7E700C6C6C60000000000C6C6C6009494940000000000C6C6C600C6C6
      C6000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00D6D6D600CECECE006363630073737300C6C6C600C6C6C600C6C6C6005A5A
      5A00636363007373730084848400000000000000000000000000000000006363
      6300CECECE00A5A5A500848484008484840063636300CECECE00FFFFFF00A5A5
      A500424242000000000000000000000000000000000000000000000000008484
      8400E7E7E700E7E7E700E7E7E700C6C6C600E7E7E700C6C6C600E7E7E700C6C6
      C600E7E7E700B5B5B50000000000000000000000000084848400E7E7E7007373
      730073737300737373007373730000000000C6C6C60094949400000000000000
      00000000000000000000000000000000000084848400FFFFFF00DEDEDE00D6D6
      D600525252004A4A4A00D6D6D600CECECE00CECECE0084848400848484000000
      0000C6C6C600737373008484840000000000A5A5A500A5A5A500A5A5A500A5A5
      A500CECECE00CECECE00A5A5A5008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000000000006363
      6300E7E7E7008484840084848400848484008484840084848400C6C6C600E7E7
      E700E7E7E700B5B5B50000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700C6C6C600E7E7E700C6C6C6000000000000000000949494000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF00DEDEDE00C6C6C600D6D6D6008484840084848400C6C6C600C6C6C6000000
      0000DEDEDE00000000000000000000000000CECECE00E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700CECECE006363630063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300E7E7E70063636300E7E7E700E7E7E700E7E7E700C6C6C600E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E7008484
      840084848400848484008484840084848400C6C6C600E7E7E700E7E7E7009494
      9400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600C6C6C600C6C6C600D6D6D600CECE
      CE00000000000000000000000000000000006363630063636300636363006363
      6300E7E7E700CECECE00636363008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      630063636300E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400E7E7E7000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700C6C6C600E7E7E70084848400000000000000
      0000949494000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400C6C6C600CECECE00CECECE00CECECE00D6D6
      D600CECECE000000000000000000000000000000000000000000000000006363
      6300CECECE0063636300848484008484840063636300CECECE00A5A5A500A5A5
      A500424242000000000000000000000000006363630063636300636363008484
      8400636363006363630063636300E7E7E700E7E7E700E7E7E700E7E7E7008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400FFFFFF000000
      0000000000009494940000000000000000000000000000000000000000000000
      000000000000000000000000000094949400D6D6D600CECECE00D6D6D600CECE
      CE00F7FFFF00F7FFFF0000000000000000000000000000000000000000006363
      63006363630084848400848484008484840084848400E7E7E700A5A5A500A5A5
      A500424242000000000000000000000000000000000000000000636363006363
      6300636363008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000084848400E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E70084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400D6D6D600F7FFFF00F7FF
      FF00949494009494940000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400E7E7E700A5A5
      A500424242000000000000000000000000000000000063636300000000006363
      6300000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400848484008484840084848400E7E7
      E700424242000000000000000000000000000000000000000000000000006363
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
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF0000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001000000000000FFFFFFFFFFF8FFFFCFE3FFFFFFF08003
      C7E3FFE3FFE08003C3E3FFC3FFC1C3FBC1E3FF83FF83E1FBC0E3FF07FF07F0FF
      C063F00FE00FF87FC023E01FC01FFC3FC023C03F803FFC3FC063C03F003FF87F
      C0E3C03F003FF0FFC1E3C03F003FE1FBC3E3E07F003FC3FBC7E3F0FF807F8003
      CFE3FFFFC0FF8003FFFFFFFFE1FFFFFFFFFFFFFFFFFFFFFF00FFC7F3FF9FF3FF
      0020C7E3FF1FF1FF0000C7C3FE1FF0FF0000C783FC1FF07F0000C703F81FF03F
      0020C603F01FF01F00E0C403E01FF00F00FFC403E01FF00F00FFC603F01FF01F
      00FFC703F81FF03F01FFC783FC1FF07F03FFC7C3FE1FF0FFFFFFC7E3FF1FF1FF
      FFFFC7F3FF9FF3FFFFFFFFFFFFFFFFFFFE07FE3F0000FFFFFDE3E0070000FFFF
      8001800100000000800100000000000080010000000000008001000000000000
      8001000000000000800300000000000080010000000000008007000080010000
      80070000C003000080070000C003000080070000C0030000800FC001C003FFFF
      801FF80FC007FFFF803FFFFFC00FFFFF8007FFFFC00FFFBF80038001E01F8007
      C0008001E03F8007C0008001E00F800780008001C007800780008001C0078007
      8000800180078007C001800180038003C001800180078003E003800180078001
      F007800180078004F013800180078006C0198001C007800F800C8001C007801F
      000F8001E007803F080FFFFFF00FFFFFFFFFFFFFFFFFF007000FFFFFFFFFE003
      0007E000FE07E0010003C000FDE3C0010001C000FBF180000001800080718000
      0001800080518000000100008041C001000100008041C001800100008043E003
      C00180008041F007E0018000807FFC1FF1118000807FFC1FF999C07F80FFF80F
      FDDDE0FF81FFF80FFFFFFFFFFFFFF80FFE000000FFBF007F00000000001F007F
      00000000001F8003000000000007C003000000000007C0070000000000078007
      0000000000070007000000000003000300000000000300030000000000010001
      000000000004000300000000000680030000000000078001000000000007C001
      00000000C007FC01FFFF0000C007FE0780010007FF18FFFFFFFF0007FC000000
      80010007F0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000700010000000100078001000055D9000700000000
      000000000000000077760000000000008001000000010000FFFFF80080030000
      8001FC00C0070000FFFFFE00E00FFFFF87FFFFFFFFFFFFFF8003FFFFFFFF8001
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
  object ilColor: TImageList
    Left = 28
    Top = 144
    Bitmap = {
      494C010129002C00280010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000005252520052525200525252005252
      5200525252005252520052525200525252005252520052525200525252005252
      5200525252005252520052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6006363FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C6000000FF00C6C6C600C6C6C6000000FF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C6000000FF006363FF006363FF000000FF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A50073737300C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600737373007373
      7300737373007373730073737300737373007373730073737300737373007373
      73007373730073737300C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031636300639CCE000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000316363009CCECE00C6D6EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      6300639CCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      6300639CCE00C6D6EF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF633100FF63000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000316363009CCE
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031636300639C
      CE00C6D6EF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      3100FF9C3100FF633100FF630000000000000000000000000000000000000000
      0000FF6331000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639CCE00C6D6
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031636300639CCE009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100FF9C3100FF9C3100FF633100FF6300000000000000000000000000000000
      0000FF9C31000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639CCE00319CCE009CCECE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100FF9C3100FFCE3100FFCE3100FF633100FF63310000000000000000000000
      0000FF9C31000000000000000000000000000000000000000000000000000000
      0000CECE3100CECE3100FFFF9C00CECE310000000000319CCE00000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      0000FF9C3100000000000000000000000000000000000000000000000000CECE
      3100CECE3100FFFF9C00FFFF9C00CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFCE3100FFFF9C00FFFFCE00FF6331000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000000000000FFFF
      CE00FFFFFF00FFEFCE00FFFF9C00CECE3100CECE310000000000000000000000
      00000000000000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFFF9C00FFFFCE00FF633100000000000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000000000000FFFF
      9C00FFFF9C00FFFF9C00FFCE6300CE9C3100CE9C310000000000000000000000
      00000000000000000000000000000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100FFFFCE00FF63310000000000000000000000000000000000000000000000
      0000FFCE3100000000000000000000000000000000000000000000000000CECE
      6300CECE6300CECE6300CECE31009C9C31009C9C310000000000000000000000
      00000000000000000000000000000000000000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFCE
      3100FF9C63000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      0000CECE6300CECE3100CE9C31009C9C31000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C310000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C31000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00E7E7E700D6D6
      D600D6D6D600D6D6D60084848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6300000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF63000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000E7E7
      E700D6D6D600D6D6D600CECECE00C6C6C600C6C6C60000000000000000009C00
      9C009C009C009C009C009C009C009C009C00000000000000000000000000FF63
      000000000000000000000000000000000000000000000000000000000000FF63
      0000FF6300000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF630000FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF630000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C6000000
      0000E7E7E700E7E7E700DEDEDE00DEDEDE00CECECE00CECECE0000000000CE00
      CE00CE00CE00CE00CE00CE00CE00CE00CE00000000000000000000000000FF63
      0000000000000000000000000000000000000000000000000000FF630000FF63
      3100FF6300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF630000FF633100FF630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF6300000000000000000000000000000000
      000000000000000000000000000000000000848484009CFFFF00CE310000CE31
      000084848400E7E7E700E7E7E700DEDEDE00D6D6D600CECECE0000000000CE00
      CE00CE00CE00CE00CE00CE00CE00CE00CE00000000000000000000000000FF63
      31000000000000000000000000000000000000000000FF630000FF633100FF9C
      3100FF6331000000000000000000000000000000000000000000000000000000
      00000000000000000000FF630000FF633100FF9C3100FF633100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF9C3100FF633100FF63000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00848484004242420063636300636363006363630000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF9C
      310000000000000000000000000000000000FF630000FF633100FF9C3100FF9C
      3100FF9C31000000000000000000000000000000000000000000000000000000
      000000000000FF630000FF633100FF9C3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FF9C3100FF633100FF630000000000000000
      000000000000000000000000000000000000848484009CFFFF00FF000000FF00
      0000FF000000FF000000C6C6C600000000000000000000000000000000008400
      840084008400840084008400840084008400000000000000000000000000FF9C
      3100000000000000000000000000FF633100FF633100FFCE3100FFCE3100FF9C
      3100FF9C31000000000000000000000000000000000000000000000000000000
      0000FF633100FF633100FFCE3100FFCE3100FF9C3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FF9C3100FFCE3100FFCE3100FF633100FF6331000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF9C
      3100000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE
      3100FF9C31000000000000000000000000000000000000000000000000000000
      0000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100FF9C3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF9C3100FFCE3100FFCE3100FFFF9C00FFFFCE00FF6331000000
      000000000000000000000000000000000000848484009CFFFF00FF633100FF63
      3100FF6331009CFFFF00C6C6C600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000FF633100FFFFCE00FFFF9C00FFCE
      3100FFCE31000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFFFCE00FFFF9C00FFCE3100FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFCE3100FFFF9C00FFFFCE00FF633100000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      31000000000000000000000000000000000000000000FF633100FFFFCE00FFFF
      9C00FFCE31000000000000000000000000000000000000000000000000000000
      00000000000000000000FF633100FFFFCE00FFFF9C00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFF9C00FFFFCE00FF63310000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000FF633100FFFF
      CE00FFCE31000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF633100FFFFCE00FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FFFFCE00FF6331000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      310000000000000000000000000000000000000000000000000000000000FF9C
      6300FFCE31000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF9C6300FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE3100FF9C6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      3100000000000000000000000000000000000000000000000000000000000000
      0000FFCE31000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFCE3100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCE310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE0000000000000000000000000000000000000000000000
      0000000000000084000000840000008400000084000000840000000000000084
      00000000000000000000000000000000000042424200CECECE00CECECE00CECE
      CE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600B5B5B500B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000084848400008400000084
      0000008400000084840084848400C6C6C600008400000084000000FFFF000084
      84000084000000000000848484000000000042424200D6D6D600EFEFEF00EFEF
      EF00DEDEDE00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600C6C6C6009C9C9C0000000000848400005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A00848400000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE000000CE000000FF000000CE00000000000000000000840000848484000084
      84000084000000840000C6C6C600FFFFFF000084000000840000C6C6C6000084
      8400008484000000FF000084000000000000424242005A5A5A00CECECE00DEDE
      DE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00C6C6C600B5B5B5005A5A5A00000000004A4A4A009C9C9C00EFEFEF00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600C6C6
      C600C6C6C600B5B5B5009C9C9C004A4A4A000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF000000CE00CECE
      CE000000CE000000FF000000CE00000000000000000000848400848484000084
      0000C6C6C6008484840000840000FFFFFF000084000000840000008484000084
      00000084840000840000008484000000000042424200E7E7E7005A5A5A00C6C6
      C600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00B5B5B5005A5A5A00B5B5B500000000004A4A4A00EFEFEF009C9C9C00EFEF
      EF00E7E7E700D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600C6C6C6009C9C9C00B5B5B5004A4A4A000000000084848400FFFFFF00CE31
      0000CE310000CE310000CE310000CE310000CE310000CE3100000000CE000000
      CE000000CE000000FF000000CE00000000000000000084848400008400000084
      8400FFFFFF00C6C6C60000FF0000FFFFFF000084000000840000008400000084
      8400C6C6C60000848400008484000000000042424200E7E7E700DEDEDE005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A00E7E7E700C6C6C600000000004A4A4A00EFEFEF00EFEFEF009C9C
      9C00E7E7E700D6D6D600C6C6C600949494009C9C9C00DEDEDE00DEDEDE00D6D6
      D6009C9C9C00D6D6D600B5B5B5004A4A4A000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF000000CE000000
      FF000000CE000000CE000000CE00000000000000000084848400008400008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000840000008400000084
      8400C6C6C600C6C6C600008484000000000042424200E7E7E7005A5A5A00C6D6
      EF00C6D6EF00C6D6EF00C6C6C600C6C6C600C6C6C600C6D6EF00C6C6C600C6D6
      EF00C6D6EF005A5A5A00C6C6C600000000004A4A4A00EFEFEF00EFEFEF00E7E7
      E7009C9C9C00C6C6C60094949400D6D6D600D6D6D60094949400DEDEDE009C9C
      9C00D6D6D600D6D6D600B5B5B5004A4A4A000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000000000CE000000
      FF00847BFF000000CE00000000000000000000000000848484000084000000FF
      0000FFFFFF00C6C6C60000840000FFFFFF000084000000840000008484000084
      000000848400008400000084840000000000424242005A5A5A0000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6D6EF00C6D6
      EF00CEFFFF00000000005A5A5A00000000004A4A4A00E7E7E700EFEFEF00D6D6
      D600C6C6C60094949400DEDEDE00DEDEDE00DEDEDE00DEDEDE0094949400DEDE
      DE00CECECE00D6D6D600B5B5B5004A4A4A000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF000000CE000000
      CE000000CE000000CE000000CE00000000000000000084848400848400000084
      0000848484000084000000840000FFFFFF000084000000840000C6C6C6008484
      840000840000C6C6C600008484000000000042424200B5B5B50000000000CEFF
      FF00C6D6EF00C6D6EF00C6C6C600C6D6EF00C6D6EF00C6C6C600C6C6C600C6D6
      EF00CEFFFF0000000000B5B5B500000000004A4A4A00E7E7E700DEDEDE00C6C6
      C60094949400E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE009494
      9400D6D6D600DEDEDE00B5B5B5004A4A4A000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE00000000000000000000000000000000000000000084848400FFFFFF000084
      00000084000000840000FFFFFF00C6C6C6000084000000840000C6C6C600C6C6
      C600C6C6C600C6C6C6000084840000000000000000008484840000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600C6C6C600C6C6C600C6D6EF00C6C6C600C6D6
      EF00CEFFFF000000000021212100000000004A4A4A00E7E7E700D6D6D6009494
      9400EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E70094949400D6D6D600C6C6C6004A4A4A000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000848400FFFFFF00C6C6
      C600008484000084000000840000008400000084000000840000008400000084
      000000FFFF00C6C6C6000000840000000000000000000000000021212100CEFF
      FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF000000000000000000000000004A4A4A00DEDEDE0094949400F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF0094949400B5B5B5004A4A4A000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000840000008400000084
      0000008400000084000000848400848484008484840084848400848484000084
      000000840000008400000084000000000000000000000000000000000000CEFF
      FF00C6D6EF00C6C6C600C6C6C600CEFFFF00CEFFFF00CEFFFF00CEFFFF00D6E7
      E700C6D6EF000000000000000000000000004A4A4A0094949400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700949494004A4A4A000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000840000008484008484
      8400C6C6C6008484840000840000008400000084000000840000008400008484
      8400C6C6C600848484000084000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00C6C6C6004A4A
      4A004A4A4A00000000000000000000000000848400004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00848400000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000084
      000000848400C6C6C60000840000008484000084000000840000C6C6C6000084
      840000840000008400000000000000000000000000000000000000000000F7FF
      FF00DEDEDE00DEDEDE00C6C6C600F7FFFF00F7FFFF00F7FFFF00848484009CFF
      FF009CCECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008484000084000000840000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484009CCE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003131CE003131CE000000
      FF0000009C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000031000000
      310000009C00000084000000FF000000CE000000CE0000009C00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      000000000000000000000000000000000000000000003131CE003131CE000063
      FF000000FF0000009C0000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000009C000000840094949400A5A5A5008484840063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      00000000000000000000000000000000000000000000000000003131CE00319C
      FF000063FF000000CE0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD0000848400000000000000FF000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      840094949400C6C6C600B5B5B500A5A5A5008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00CECECE0000009C000000FF000000CE0000009C00CECE
      CE00000000000000000000000000000000000000000000000000212121003131
      CE00319CFF000000FF0000009C00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD000000FF0000009C000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60000000000000000000000000000000000000000000000
      0000CECECE00C6C6C600B5B5B500A5A5A5008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0000009C00319CFF000000CE009CFFFF000000CE000000
      9C00000000000000000000000000000000000000000000000000008484009CCE
      CE000000CE000063FF0000009C00FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE000000FF0000009C00000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C6009C313100C6C6C6009C313100C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000000000001818
      180000000000C6C6C600B5B5B500A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00CE31
      0000CE310000CE3100000000CE000000CE00CE310000CE3100000000CE000000
      9C00000000000000000000000000000000000000000000000000008484009CCE
      CE009CCECE000000CE000000FF0000009C008484000084840000FFFFFF00F7F7
      F7000000FF0000009C0000848400000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF008400000084000000840000009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000000000000181818001818
      18000000000000000000C6C6C600CECECE00CECECE00CECECE00CECECE00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF000000
      CE0000009C000000000000000000000000000000000000000000008484009CCE
      CE009CCECE00E7E7E7000000CE000000FF0000009C00FFFFFF00FFFFFF000000
      FF0000009C009CCECE0000848400000000000000000084848400F7F7F700C6C6
      C600C6C6C600840000009C633100C6C6C6009C63310084000000C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000018181800181818001818
      1800000000000000000000000000DEDEDE00D6D6D600D6D6D600CECECE00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF000000
      CE0000009C0000000000000000000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E700848400000000CE000000FF0000009C000000FF000000
      9C009CCECE0094ADAD004A4A4A00000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF009C6331009CFFFF009C63310084000000C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000021212100181818000000
      00000000000000000000C6C6C600DEDEDE00DEDEDE00D6D6D600CECECE00C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000000CE0000009C0000000000000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400000000CE000000FF0000009C00D6D6
      D60094ADAD00009C9C0010101000000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C600840000008400000084000000C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000018181800181818000000
      000000000000C6C6C600EFEFEF00EFEFEF00DEDEDE00D6D6D600D6D6D600CECE
      CE00C6C6C6000000000000000000000000000000000084848400FFFFFF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000009CFFFF00CECE
      CE000000CE0000009C0000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD000000CE000000FF0000009C000000CE000000
      9C0094ADAD004242420000000000000000000000000084848400F7F7F7009CFF
      FF00C6C6C600840000009C6331009CFFFF009C6331009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000018181800181818000000
      00000000000000000000C6C6C600DEDEDE00DEDEDE00DEDEDE00FF000000EFEF
      EF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000CE0000009C00000000000000000000000000000000000000
      000021212100009C9C000000CE000000FF0000009C00639C9C00639C9C000000
      CE0000009C000000000000000000000000000000000084848400F7F7F700C6C6
      C600C6C6C600840000009C633100C6C6C6009C63310084000000C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000021212100181818001818
      180000000000000000000000000000000000DEDEDE00DEDEDE00000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FF63
      3100FF633100FF633100FF633100FF6331009CFFFF00FFFFFF00FFFFFF00CECE
      CE0000000000000000000000CE0000009C000000000000000000000000000000
      00000000CE000000CE000000FF0000009C000084840000848400313131000000
      00000000CE0000009C0000000000000000000000000084848400F7F7F7009CFF
      FF00C6C6C6009CFFFF008400000084000000840000009CFFFF00C6C6C6009CFF
      FF00F7F7F700C6C6C60000000000000000000000000018181800181818001818
      180000000000000000000000000000000000C6C6C600DEDEDE00DEDEDE00CECE
      CE00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009CFFFF00FFFFFF0084848400000000000000
      00000000000000000000000000000000CE0000000000000000000000CE000000
      CE00319CFF000000FF0000009C00009C9C0094ADAD00009C9C004A4A4A000000
      0000000000000000CE0000009C00000000000000000084848400F7F7F700C6C6
      C600C6C6C600C6C6C6009C313100C6C6C6009C313100C6C6C600C6C6C600C6C6
      C600F7F7F700C6C6C60000000000000000000000000000000000181818002121
      21001818180000000000000000000000000000000000C6C6C600DEDEDE00CECE
      CE00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000
      000000000000000000000000000000000000000000000000CE00319CFF000063
      FF000000FF0000009C0000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      100000000000000000000000CE0000009C000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700C6C6C60000000000000000000000000000000000181818002121
      2100212121001818180021212100181818000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000CE00319CFF000063FF000000
      FF0000009C00009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000001818
      1800181818001818180018181800181818000000000000000000000000000000
      0000181818000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      00000000000000000000000000000000000063639C000000CE000000CE006363
      9C0000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121001818180021212100181818001818180018181800181818001818
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3100008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000CE000000CE000000CE000000CE000000
      CE000000CE000000000000000000000000000000000000000000000000004A4A
      4A0094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E70094ADAD0094AD
      AD0094ADAD000084840000000000000000000000000084848400848484000000
      000000CECE0000CECE0000CECE0000CECE000000000084848400848484000000
      0000C6C6C6000000000000000000000000000000000000000000006363009CFF
      FF00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009CCE00009C
      CE00009CCE00009CCE0000000000000000000000000000000000000000000000
      000000000000000000000000CE00000000000000000000000000000000000000
      CE000000FF000000CE00000000000000000000000000000000002121210094AD
      AD009CCECE00E7E7E700EFEFEF00848400008484000084840000FFFFFF00C6C6
      C6009CCECE0094ADAD0021212100000000000000000084848400848484000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C60000000000000000000000000000000000006363009CFF
      FF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CEFF00009C
      CE0000CEFF00009CCE0000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000008484009CCE
      CE009CCECE00F7F7F70084840000FFFFFF0084840000FFFFFF0084840000D6D6
      D6009CCECE009CCECE0000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009CCE0000CE
      FF00009CCE0000000000009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CE000000FF000000CE00000000000000000000000000008484009CCE
      CE009CCECE00F7FFFF00EFEFEF00FFFFFF008484000084840000FFFFFF00F7F7
      F7009CCECE009CCECE0000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF009CFF
      FF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CEFF00009C
      CE0000CEFF0000000000009CCE00000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000CE000000
      00000000CE000000FF000000CE00000000000000000000000000008484009CCE
      CE009CCECE00E7E7E700FFFFFF008484000084840000FFFFFF00FFFFFF00EFEF
      EF009CCECE009CCECE0000848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF00CEFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF000000000000CEFF00009CCE000000000000000000848484009CFFFF00CE31
      0000CE310000CE310000CE310000C6C6C60000000000000000000000CE000000
      CE000000CE000000FF000000CE000000000000000000000000004A4A4A0094AD
      AD009CCECE00E7E7E70084840000FFFFFF0084840000FFFFFF0084840000E7E7
      E7009CCECE0094ADAD004A4A4A00000000000000000084848400848484000000
      0000000000008484840084848400000000000000000084848400848484000000
      0000C6C6C600C6C6C6000000000000000000006363009CFFFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF0000000000009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      FF000000CE000000CE000000CE00000000000000000000000000101010000084
      840094ADAD00C6C6C600EFEFEF00848400008484000084840000EFEFEF00D6D6
      D60094ADAD00009C9C0010101000000000000000000000000000848484000000
      0000C6C6C600000000008484840000000000C6C6C60000000000848484000000
      0000C6C6C600C6C6C60000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      6300009CCE0000CEFF00009CCE000000000000000000848484009CFFFF00FF00
      0000FF000000FF000000FF000000C6C6C60000000000000000000000CE000000
      FF00847BFF000000CE0000000000000000000000000000000000000000004242
      420094ADAD0094ADAD0094ADAD00E7E7E70084840000E7E7E700D6D6D60094AD
      AD0094ADAD004242420000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600000000000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF0000CEFF0000CEFF0000CE
      FF0000CEFF00009CCE00009CCE00000000000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000000000000000CE000000
      CE000000CE000000CE000000CE00000000000000000000000000000000000000
      000021212100009C9C00639C9C00639C9C00639C9C00639C9C00639C9C00009C
      9C00212121000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C600000000000000000000000000006363009CFFFF00CEFF
      FF0000CEFF009CFFFF0000CEFF0063FFFF0000CEFF0031CEFF009CFFFF009CFF
      FF009CFFFF009CFFFF009CFFFF000000000000000000848484009CFFFF00FF63
      3100FF633100FF6331009CFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031313100009C9C000084840000848400313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000C6C6C600000000000000
      000000000000C6C6C600000000000000000000000000006363009CFFFF0000CE
      FF00CEFFFF0000CEFF009CFFFF0000CEFF009CCECE0000636300006363000063
      6300006363000063630000636300006363000000000084848400FFFFFF009CFF
      FF00FFFFFF009CFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A00009C9C0094ADAD00009C9C004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006363009CFF
      FF009CFFFF009CFFFF009CFFFF009CCECE000063630000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010100000CECE009CCECE0094ADAD0094ADAD0000CECE001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      6300006363000063630000636300006363000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C00009C9C009CCECE009CCECE0094ADAD0000CECE004A4A
      4A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009C9C0021212100009C9C0042424200009C9C0021212100009C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECE9C00CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300FFFFFF00CE9C6300CE9C6300CE9C6300CE9C6300FFEF
      CE00CECE9C00CE9C3100CE9C6300CE9C63000000000000000000000000000000
      0000000000000000000000000000000000000000000000009C00000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE630000CE630000F7F7F700CE633100CE630000CE630000CE633100FFFF
      FF00CE6331009C630000CE6300009C6331000000000000000000000000000000
      00000000000000000000000000000000000000009C000000FF0000009C000000
      00000000000000000000000000000000000084000000FF000000FF000000FF00
      000084000000C6C6C60084000000FF0000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE63
      00009C6300009C630000F7F7F700CE6331009C6300009C630000CE9C9C00F7CE
      A5009C630000CE6300009C630000CE63310084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000009C000000FF000000CE0000009C000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000C6C6C600B5B5B500A5A5A50000000000000084000000FF000000CE000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000CE630000F7F7F700CE633100CE6300009C630000EFEFEF00CE9C
      31009C630000CE630000CE6300009C63310084848400FFFFFF00CE310000CE31
      0000CE310000CE31000000009C00319CFF000000CE00C6C6C6000000CE000000
      9C0000000000000000000000000000000000000000000000000084848400C6C6
      C600B5B5B500A5A5A50000000000000000000000840000008400C6C6C6000000
      9C000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CECE9C00CE9C6300CECE6300CECE
      6300CE6331009C630000F7F7F700CE9C6300CE9C3100CECECE00CECECE009C63
      00009C630000CE6300009C6300009C63310084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF000000CE000000CE009CFFFF00C6C6C6000000CE000000
      9C00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000008400C6C6C600B5B5B500A5A5
      A5000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF0000000000EFEFEF00CE9C9C00CE9C6300CE9C
      9C00F7F7F700CECE9C00F7F7F700F7CEA500F7CEA500DEDEDE00CECE9C00CE63
      3100EFEFEF009C6331009C6300009C63310084848400FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000B5B5B500A5A5A5000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C630000CE6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE9C6300EFEF
      EF00F7F7F7009C6331009C630000CE63310084848400FFFFFF009CFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C600000000000000
      CE0000009C000000000000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600D6D6D600C6C6C60000000000A5A5A500000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      00009C630000FFEFCE00FFFFFF00CE6331009C6300009C6300009C630000FFFF
      FF00F7F7F700CE633100CE6300009C63310084848400FFFFFF00FF633100FF63
      3100FF633100FF633100FF633100FF633100FFFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000000000000000
      0000C6C6C600D6D6D600CECECE00CECECE00C6C6C60000000000D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C63009C6300009C6300009C63
      0000CE633100FFFFFF00FFFFFF00CE6331009C6300009C630000CE633100FFFF
      FF00F7F7F7009C633100CE6300009C63310084848400FFFFFF00FFFFFF00FFFF
      FF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C6000000CE0000009C0000000000000000000000000000000000000000000000
      000000000000D6D6D600D6D6D600FF00000000000000D6D6D600D6D6D600D6D6
      D600C6C6C60000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000CE9C63009C6300009C630000CE9C
      6300F7F7F700CE9C6300FFFFFF00CE9C6300CE9C6300CE9C9C00E7E7E700F7CE
      A500EFEFEF009C6331009C6300009C63310084848400FFFFFF00000084000000
      84000000840000008400FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000CE0000009C00000000000000000000000000000000000000
      000000000000C6C6C600D6D6D600D6D6D60000000000C6C6C600D6D6D600CECE
      CE00CECECE00C6C6C60000000000000000008484840084848400848484008484
      840084848400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000CE9C6300CE9C3100E7E7E700FFCE
      CE00CE9C3100CE630000CE9C9C00CECE9C00CECE9C00CE9C9C00CE9C6300CE63
      0000F7F7F7009C6331009C630000CE63310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CFFFF00C6C6C60000000000C6C6
      C60000000000000000000000CE00000084000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000D6D6D600D6D6
      D600FF00000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840000000000CECE9C00F7F7F700CE9C63009C63
      0000CE6300009C6300009C630000CE6300009C630000CE630000CE630000CE63
      0000F7F7F7009C6331009C6300009C63310084848400FFFFFF003100FF003100
      FF0000008400FFFFFF00FFFFFF009CFFFF00FFFFFF00C6C6C60000000000C6C6
      C6000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600D6D6
      D600D6D6D60000000000000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C60000000000FFFFFF00CE9C63009C6300009C63
      00009C630000CE6300009C6300009C6300009C6300009C6300009C6300009C63
      0000F7F7F7009C633100CE6300009C63310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C60000000000FFFFFF00CE9C6300CE6300009C63
      00009C630000CE6300009C630000CE6300009C630000CE630000CE6300009C63
      0000F7F7F700CE633100CE6300009C6331008484840084848400848484008484
      840084848400848484008484840084848400848484008484840000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400F7CEA500EFEFEF00CE9C31009C63
      3100CE633100CE6331009C6300009C630000CE630000CECE9C00CECE9C00B5B5
      B500FFFFFF00CECE9C00CECE9C00F7CEA500000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE9C6300CECE6300F7F7F700D6D6
      D600EFEFEF00CECE6300CE630000CE630000CE630000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000808080000000000080808000000
      0000000000000808080000000000080808000000000000000000080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00080808000000000000000000000000000000000000000000000000000000
      000000000000000000000000000031313100C6C6C600FFFFFF00C6C6C6000000
      00000000000031636300639CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF009CFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000031313100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000316363009CCECE00C6D6EF000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000003131
      3100C6C6C600FFFFFF00FFFFFF00FFFFFF00FFCECE00FF636300000000003163
      6300639CCE00C6D6EF00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFCECE00FF636300FFCECE000000000031636300639C
      CE00C6D6EF0000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF009CFFFF00FFFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFCECE00FF636300FFCECE00FF6363000000000031636300639CCE009CCE
      CE000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00FFFFFF00FF63
      3100FF633100FFFFFF00FF633100FF633100FF633100FF633100FFFFFF00CECE
      CE00000000000000000000000000000000000000000031313100DEDEDE000000
      000000000000000000000000000000000000639CCE00319CCE00C6D6EF000000
      0000FFFFFF0031313100000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF009CFF
      FF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF009CFFFF00FFFFFF00CECE
      CE000808080000000000000000000000000000000000FFFFFF0000000000CECE
      3100FFFF9C00CECE3100CECE31000000000000000000319CCE0000000000FF63
      6300FFCECE00C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C60084848400FF00000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C0000000000FF9C9C0000000000FF9C9C00FF9C9C00FF9C9C0000000000FF9C
      9C00FF9C9C0000000000000000000000000084848400FFFFFF009CCECE009CCE
      CE009CFFFF00FFFFFF009CFFFF009CCECE00000000009CCECE009CFFFF00CECE
      CE00000000000000000000000000000000000000000000000000CECE3100FFFF
      9C00FFFF9C00CECE3100CECE3100CECE31000000000000000000FFCECE00FF63
      6300FF636300FFFFFF00313131000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00003100000031
      00009CCECE00FFFFFF009CCECE00003100009CCECE00000000009CCECE00CECE
      CE000000000000000000000000000000000000000000FFFFCE00FFFFFF00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FF636300FFCE
      CE00FF636300FFCECE00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600000000000000000000000000FF9C9C000000
      000000000000FF9C9C00FF9C9C0000000000FF9C9C0000000000FF9C9C00FF9C
      9C0000000000FF9C9C00FF9C9C000000000084848400FFFFFF00639C9C00CEFF
      FF00003100009CCECE00003100009CCECE00316363009CCECE00000000000000
      00000808080000000000080808000000000000000000FFFF9C00FFEFCE00FFEF
      CE00FFFF9C00CECE6300CECE3100CECE3100CECE310000000000FFCECE00FFCE
      CE00FFFFFF00FFFFFF00FFFFFF00313131008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00639C
      9C00CEFFFF00003100009CCECE00316363009CCECE0031636300639C9C00639C
      9C00639C9C0000000000FF633100FF63310000000000FFFF9C00FFFF9C00FFFF
      9C00FFCE6300CECE3100CECE3100CE9C3100CE9C310000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6003131310084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000008484840084848400848484008484
      8400639C9C00CEFFFF00003100009CCECE00316363009CCECE009CCECE009CCE
      CE00639C9C00639C9C00FF9C3100FF9C310000000000FFFF3100FFCE9C00FFCE
      9C00FFCE6300CECE3100CECE31009C9C3100CE9C31000000000094949400DEDE
      DE00C6C6C60031313100000000000000000084848400FFFFFF00000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00000000000000
      000084848400FFFFFF00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000639C9C00CEFFFF0000310000CEFFFF00CEFFFF009CCECE009CCE
      CE009CCECE009CCECE00FFCE3100FFCE31000000000000000000CECE6300CECE
      6300CECE3100CECE3100CECE31009C9C310000000000DEDEDE00B5B5B5001818
      18006363630000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00FF9C9C00000000000000000000000000000000000000
      00000000000000000000639C9C00FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00639C9C00FFFF9C00FFFF9C00000000000000000000000000CECE
      3100CECE3100CE9C3100CE9C3100000000008484840084848400848484003131
      3100000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000639C9C00639C9C00639C9C00639C9C00639C
      9C00639C9C00FFFFFF00FF633100FF6331000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      FF00D6D6D600CECECE003131FF0000000000C6C6C600C6C6C600C6C6C6005A5A
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
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF0000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001000000000000FFFFFFFFFFF8FFFFCFE3FFFFFFF08003
      C7E3FFE3FFE08003C3E3FFC3FFC1C3FBC1E3FF83FF83E1FBC0E3FF07FF07F0FF
      C063F00FE00FF87FC023E01FC01FFC3FC023C03F803FFC3FC063C03F003FF87F
      C0E3C03F003FF0FFC1E3C03F003FE1FBC3E3E07F003FC3FBC7E3F0FF807F8003
      CFE3FFFFC0FF8003FFFFFFFFE1FFFFFFFFFFFFFFFFFFFFFF00FFC7F3FF9FF3FF
      0020C7E3FF1FF1FF0000C7C3FE1FF0FF0000C783FC1FF07F0000C703F81FF03F
      0020C603F01FF01F00E0C403E01FF00F00FFC403E01FF00F00FFC603F01FF01F
      00FFC703F81FF03F01FFC783FC1FF07F03FFC7C3FE1FF0FFFFFFC7E3FF1FF1FF
      FFFFC7F3FF9FF3FFFFFFFFFFFFFFFFFFFE07FE3F0000FFFFFDE3E0070000FFFF
      8001800100000000800100000000000080010000000000008001000000000000
      8001000000000000800300000000000080010000000000008007000080010000
      80070000C003000080070000C003000080070000C0030000800FC001C003FFFF
      801FF80FC007FFFF803FFFFFC00FFFFF8007FFFFC00FFFBF80038001E01F8007
      C0008001E03F8007C0008001E00F800780008001C007800780008001C0078007
      8000800180078007C001800180038003C001800180078003E003800180078001
      F007800180078004F013800180078006C0198001C007800F800C8001C007801F
      000F8001E007803F080FFFFFF00FFFFFFFFFFFFFFFFFF007000FFFFFFFFFE003
      0007E000FE07E0010003C000FDE3C0010001C000FBF180000001800080718000
      0001800080518000000100008041C001000100008041C001800100008043E003
      C00180008041F007E0018000807FFC1FF1118000807FFC1FF999C07F80FFF80F
      FDDDE0FF81FFF80FFFFFFFFFFFFFF80FFE000000FFBF007F00000000001F007F
      00000000001F8003000000000007C003000000000007C0070000000000078007
      0000000000070007000000000003000300000000000300030000000000010001
      000000000004000300000000000680030000000000078001000000000007C001
      00000000C007FC01FFFF0000C007FE0780010007FF18FFFFFFFF0007FC000000
      80010007F0000000FFFF0007C001000080010007C003000075D60007C0030000
      00000007800300007416000700010000000100078001000055D9000700000000
      000000000000000077760000000000008001000000010000FFFFF80080030000
      8001FC00C0070000FFFFFE00E00FFFFFDFFFFFFFFFFFFFFF8002FFFFFFFF8001
      80030000F00FFFFF80010000F81FFE7FC0010000FC3FFC3FC0030000FE7FF81F
      C0030000FFFFF00FC00300008001FFFFC0030000FFFFFFFFC00300008001F00F
      C0030000FFFFF81FC0030000FE7FFC3FC0070000FC3FFE7F80030000F81FFFFF
      001D0000F00F80019FFFFFFFFFFFFFFFFC7F0000E001FFFFF01F0000E0018007
      C0070000E001800780010000E00180008001F807E00180000001F807E0018000
      0000E807E00180000000E007E00180000100E007E001800700000007E0018007
      80010007A0018007E0070007C0038003F803E0070007800BFE00E007C00F801F
      FF03F807ABFF803FFF8FF807EFFFFFFFFFFFFFFFFFFF8001FFF7FE7F81F70000
      C1E7FC3F9DE3000081C7F81FCFE300000381F80FE7C100000700F007F3C10000
      0E00F003B9F700000600E00181F700000300E001FFF700000000C00388F70000
      0000C00F9CF700000000803FC1F70000000081FFC9F7000080010FFFE3F70000
      C0031FFFE3F70000FFFFFFFFF7F7800100000000000000000000000000000000
      000000000000}
  end
  object JvCaptionButton: TJvCaptionButton
    Caption = #183
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    Hint = 'Minimizar a la bandeja de sistema'
    Standard = tsbMinimizeToTray
    OnClick = JvCaptionButtonClick
    Left = 84
    Top = 116
  end
  object JvTrayIcon: TJvTrayIcon
    IconIndex = 0
    Hint = 'Red Prestacional'
    Snap = True
    Visibility = [tvVisibleTaskList, tvAutoHide]
    OnDblClick = JvTrayIconDblClick
    Left = 56
    Top = 144
  end
  object JvBackground: TJvBackground
    Image.Mode = bmBottomRight
    Image.Picture.Data = {
      0A544A504547496D616765C52A0000FFD8FFE000104A4649460001010100B600
      B60000FFDB0043000503040404030504040405050506070C08070707070F0B0B
      090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F131722
      24221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
      1E1E1E1E1E1E1E1E1E1E1E1E1EFFC0001108012C012C03012200021101031101
      FFC4001F0000010501010101010100000000000000000102030405060708090A
      0BFFC400B5100002010303020403050504040000017D01020300041105122131
      410613516107227114328191A1082342B1C11552D1F02433627282090A161718
      191A25262728292A3435363738393A434445464748494A535455565758595A63
      6465666768696A737475767778797A838485868788898A92939495969798999A
      A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
      D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
      01010101010101010000000000000102030405060708090A0BFFC400B5110002
      0102040403040705040400010277000102031104052131061241510761711322
      328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
      292A35363738393A434445464748494A535455565758595A636465666768696A
      737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
      A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
      E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F42A
      28A2BF2238828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
      A0028A28A0028A28A0028A4240193C5559B52D3E16DB2DE4087D0B8A6A2DEC35
      16F62DD154A3D574D90E12FADC9FF7C55A492371947561EC734DC5ADD0DC5ADD
      0FA28AADA8DEDB585B35C5D4AB1A28EFDE924E4EC84936EC89E5748A3692460A
      AA32493C0AE4B54F14BBCA534F9AD2DE0076FDA6E5B0AC7FD91DEB90F17F8B6F
      35A9BEC5621E3B7270AABD5FEB59D0F86AF2F145BC7BE6BCC64A83958C7A13EB
      5F5797E474E9C3DBE3345DBFCCEA85251DF567728FE23B88CCD6DE23B1954F4F
      29030FD2A37BEF16DB7FCBF59CD8ECD1E3FA579D5EF8175E864322D8CF1BFF00
      CF481CA37E6A6AAB5878CAD7E517DAE003B3CA5FFF0042CD7B11C3E555168A25
      F2B7B25F723D3E2F196A768E06A7A62BA77781B38FC2BA9D1759B0D5E0F36CA7
      0FFDE53F797EA2BC02E2E3C510444CF737E517925C0FF0ABFE19D76E3ED092C1
      3793A8C7D0F41381D8FBD71E2F87F0D5A0E585767F7A2254D3DD58FA068AC6F0
      9EBB06BBA62DC27C932FCB2C7DD5BBD6CD7C554A72A727092B34734A2E2ECC28
      A28A82428A28A0028A4C8F5A5A0028A28A0028A28A0028A28A0028A28A0028A2
      8A0028A28A0028A28A0028A28A002B1FC45A9C96622B7B62A2797272C3215477
      C56C579EF88B50F375CB86CF0988D7E83FFAF5D982A2AAD5F7B6475E0E92A953
      5D911EA51EB17A4993533203FC392A3F2159326937C39D81FE8D57D6F7FDAA91
      6F3DEBDCF614F65A1ED2825A2311ECEEE3FBD0483F0A62CB3C272B24919F6245
      746B79EF4E3711B8C3AAB7D466A5E1D7461CA6459EB1AC2C891417F3EE621541
      7C8CFE35DA78EFC19ACCFE038EF9167D5756122B3C717F0A60E5540E09E7F4AE
      79E1B093EF5B479F5031FCAADD8DCDCD8B06D3F53BFB423A79570C07E55D5825
      4F0D3E794799F4F230AB41CBE1D0E72DF4DBAD0ECA2B9BAD3AE2DA7B8E0493A8
      5703B855EA3EA6BA4D17C53A5E9F6E208F4F9221FC4C08258FA9354354B49F52
      BA7BABBD4A7B89DFABCA771AA1268B38FB92C6DFA56598CE78C9FBCBDDE8AE4A
      C345C396476F078C34693EF49247FEF2D5E835DD1E6FB97D0FFC08E2BCC25D26
      F97388777FBA6A94D6B751FDF8255FF809AF29E023E68CA581A7D2E7B0DD47A7
      6A76725B48D0CD1C83040606BC13E20785EE7C37AA178B71B676DD1483B569F9
      B346D9591D48F7A65E5E5CDD5B35B5CCAD34447DD73915E865929E0AA5E32BC5
      EE851C2F2AB5F42A782FC5B71A6EB504E033BCAC239E3519F37B0603D6BDF2C6
      EE3BB87CC40CA41C3A30C329F422BC63E157817C4D73E35D1359B3D1AE6EB498
      3518CCB72AA0A285605B3F415F42F8E3C397115CDDEADA1AA34F1A1692027025
      51CFE63D6BD5CDF2A58D87D628FC5F9AFF003396A42FEEBDCC9A4240EB5E7F07
      C4CB4FF978B275FF0074D5EB3F1DE99A8DD47676A93BDCCADB52354C926BE3FE
      A388BDB94C9E1AA2DD1D7B4C8BDEAB4D788BFC42AF597866F27896E351BA1671
      B0CECFE2FEBFA0FC6B99F8BB65F0FF004AF06EAD36ABA962E85949E4472DE321
      77DA76ED8F772D9E981D6BD7C370E622A59D4F757E3F712A933496FD09C6E156
      E19D5C706BE04B5D5753B5944B6BA8DE4120E8D1CECA7F306BE90FD9A3C47ADE
      B5A1EA09AB5EDC5EFD9EE556296662CD82BCAE4F2718CF3EB466190CB0B49D55
      3BA5F20953B2B9EE439A5A8E1394E695A455AF9D321F45442652719A90104714
      00B451450014514500145145001451450014514500145145003266090BB1E814
      9AF3FF000969DFDADE30B28A41B926B8DEE0F750771FD05773AB36CD2EE5BD22
      63FA550F84D663FE12449C8FF556ECC3EA703FAD7B79353E69BF547A581F7612
      91E95A8F87F40BBC9B8D1EC5C9EFE4807F315CFDF780FC312E4A593C07FE99CA
      47F3AEB257AA93357D74E1096E8DA3292EA70579F0E74CE4DB5F5CC7ECD86AC8
      BAF87F771E4DBEA51BFB3A915E932B55494D734A853EC6AAA4BB9E5B71E12D76
      0276AC528FF65FFC6A84DA5EB3067CCB09B8EEA33FCABD566354E6358CB0F1E8
      CD1556795BCB3C4712C5221FF6948A55BCFF006ABD1AE30C082011EF59577636
      729264B5858FAEC158BA2D6CCB553C8E496F3DEA55BCF7AD4B8D22C0E76C3B3F
      DD622B3E6D2611F725917EBCD4384915CC88DE4825189628DFFDE506ABC961A5
      4BF7AD114FAAF14B258C887E5981FA8AAEC9709DC1FC6A1A7D4764CD4D327D43
      4BB636DA46BDAAE9D0162C6282E595327BE3A66A3D42EBC53776D2DBB78B2FDE
      39576BABB9F987A1239C566F9F22F506945E1C75AA5564959321D28BE87397FE
      1BBE894949217FC715EBBF09FC2F65E0BF0A49E28D6523FED1B842C1994FEE63
      E0EDFAF73EF81D8570FA43B5FF008874FB30A24592E103A93D501CB7E80D7A17
      C73BF6B3D134CD2E36DBE7905C63A85E4FEA56BD2C125084AB3E872D7579282E
      A792F8FBE2278ABC417B20B66BCD2AC371D8B192B238F5761FC871F5EB5E7F3D
      BF9A184C4C9B8E583F393EF9AF57D3E602302A9F8FCDA59781E6D49EDE10F2CD
      E546FB064051B9C83F90FC6B0F6F2AB3D4D1D2508DCF23BA8347B11E6DD5AE9A
      80F796DE339FD39ADAF07FC45834BB8874DD2A5B786267C88A2B711A13DFA0C6
      4D78EEA97D3EA178F733B962C7804FDD1E82A1B795A19E3990E1918303F4AF4E
      58085485AA6A71BA89F4D0FBDFC37AA45ABE8D0DF458F9C7CC3D0D713F1B3C78
      DE08F0F25CDB42B3DF5D4862B65707602064B363B0E38EF9A8BE026A26F3449E
      12D91859147D45747E3BF0BE9BE27D225D3754B61342DCA9E8D1B76653D8D7C2
      7B2A586C6F2D5578A7F81C9560A151AE8788F807E3BDDFDAD2D3C5B146636381
      790260AFFBC83A8F71F91AFA0F46D56DEFEDA39EDA649A2914323A364303DC1A
      F92BC4BF0BB50D03C536567A85C84D0EEAEA389B53DBF2C08CC016907F090327
      9E0FAD7D4D6DE03B1F0658DBDCF8627964D0DA150F0BC86431C9DE4079E181C9
      1D38047535EEE6395E1EB50788C2FDCBFAD02504D5D1D2A9C8CD2D53B19C4880
      E6AE57C8356310A28A290828A28A0028A28A0028A28A0028A28A00A3AF9C68B7
      67FE991ABFF0D20F2B5099B1FF002EE07EA2B3BC45FF00205BAF74C7EB5D2782
      61F2EE2638C6621FCEBE8F225BBF33D1C27F099D24A6AACB56A4155A515F4AD9
      B22A4B5566AB928AAB2AD66CB45297AD549464F157A55AE87E1CE8A9A8EAED75
      709BA0B5C1C11C16ED5318B9C9450DC9455C4F0C7C3EB8D4224BBD5246B685B9
      58C0F9C8F7F4AE921F00784674291AB4CCBC165B8C907F0AECEBC2751006A373
      8007EF5874F735C19F66D4F248537ECB9F9AFD6DB5BC9F738EA621A36BC5DF0B
      1E181EE7429DE6DA326093EF1FA1AF26BA89E391E3914ABA921948C107D2BEA6
      F0EB17F0FE9CECC599AD632493C93B457967C76F0BC69247E20B44DBE636CB90
      BD09ECD5E957A119D155A9ADD276F53A68D6BBB33C7670013C8AA3300738AD66
      B5F6A8DAD7DABCB69B3B1330A4889ED50496DC1AE81AD7DAA296D70A78A9E52B
      988BE17E9DF69F1F5B67FE58C6EFF9FC9FFB3D6D7ED07702E3C47A7D9A119822
      76207A36D03F543577E0E5806F175C5D7398A2098EDF31DDFF00B25627C4A6FB
      778F2ECE0FEE9123CFAE7E7FFD9EBD44B9305EAFFAFC8E4BDEBFA1C9DBA4A000
      39AA9FB50B1D17C25A36899C491D879B28FF006E5619FD05771E0FD1BFB4BC4B
      A7596DCAC93AEFFF00741C9FD057977ED9FA8FDA7C737D0A9F9629638140F454
      CD73E069DEA5CD3113D2C7CF3454D676D71773AC16D134B23740A2BBBF0AF820
      3DCC02F879F3C8E15215FBB9278CFAD7BD52AC69AD4F3E3072D8F60FD9A4DC7D
      82299A3710CB06C572382C3048FE55ED72206159361A1DBF876D7C3FA55BC6A8
      21865DDB4632C40C9AD9AFCEF39D714DA31C57C4BD0C8D474D8A78D95D15948E
      411906B5FC0772332787EE40681A3DB1823809D02E3D8E31EC71DA9B26369CD6
      7E9225FF0084A6D4C3DB717FA6D38FD715AE49899D3C5462B67A3F999536EE32
      184D86A975A7962DE449B79EB8C647E8456A29C8A3C5EA89E2FB8F2C019552DF
      5C5362FBB5C999528D2C4CE11D93629AB31F4514570101451450014514500145
      145001451450050D7F9D2271FEEFFE842BB5F0DC3B26938EB18AE2F5CE74B947
      BAFF00E842BD2349B7D8E4E3F82BE9B215EE4BD4F430CFF76FD7FC87C8B55E44
      AD1923F6A8248BDABE899B266648955E44AD299028CB550B80EFC282A2B29148
      CEBA744E3AB7A5763E1B926B2F86F7D7D6EE629DA42C1D7A8C151FE35CA35AFB
      5775E0582DEFFC3377A4DC8253CC3B803838383FCC5108CA7CD18BB369A5EB60
      934AD739587C65E228F03EDFBC7A34487FA66B0A691A595E57FBCEC58FD4D7A0
      EA7E00B18ECE696D2F2EBCC48D9955F6B0620671C015E775F9267B84CCF08E10
      C7CDCAF7B5E4E5EBB9E4CE3256BB3B8D17C77158E9B6B652E9D238863085D651
      CE075C63FAD6AF886FAD3C4DF0FF00529E08E44540415900C865C1EDEC4571B6
      9E16D6EEEC22BDB5B459A2946540914363A720E2BA2B4B5BBD1FE1DEA305FC06
      09A69982A3104E0851DBE86BECF8731D9C549AA58B83F65C9A371B7456D57FC3
      9D5479EEAE8F1F6B5F6A8DAD7DABA06B5F6A8DAD7DABDDE43D3E639F6B5F6AAD
      75005435BF70A8839C5721E2DF13691A41582E6E87DA641FBBB78C17964FA20E
      4D38D2727640E691DCFC25448ADB53BB03E746619FA2A91FCCD70BAA4A977E28
      D467241FDF18FF00EF8F97FF0065AEFBE1748F2F801AFE5B49AD1EE493E54C00
      719720671DF6806BE58D67C7DB354BA961F16CA52499D80B3D294E0124FDE95B
      9FCABD69E1A53A318239235129B91F4FFC228213E2AFB43631040CC3EA78FEA6
      BE69F8DF671788FC77AC3CD3BC616FE4230339E71FD2A969DF14EFF4E99A6B1F
      17F892095800CC2C6D4823D36918AC29F54B2D4AF65BB7F194A93CCECEFF006D
      D336E589C9E63240FC85670C1D4A6BDD7A8E55A327A9A3A4E9F65A641E55A44A
      B9FBCDDDBEA6BD13E09E96BA9F8E609645CC56486E1BD32385FD4FE95E696F6F
      AC49FF001E171A4EB5DF6D9DD05971FEE3E09FC2BD1BE08F8B746F0F5EDF5BF8
      8267D1EFEE362C71DEC6630CA339C31F97A9F5A89D0A8B5652A91B591EE7E24F
      F90D697FEECDFC851599AB6A705C6A9A5491C8AEA5252194E41040E6AE89D4AE
      41AF8CCE13FACFC91C58AF8D7A0CBB944686AFF816C84978FAACC0AA2E704F4D
      80824FE2401F87BD633C6FA85EC767113F31F9D87555EE7FCF735BBE2EBC5D27
      488B46B46D973301BF6FF0A8EDF971F8FB57A391E1E34A32C655DA3B7A99D356
      D59812DCA6A3E20BEBE8DB724D2E54E7208000047B719AD34185ACDD2AD84518
      0056A57838AACEB5594DF5667277614514573921451450014514500145145001
      451450052D6FFE4192FD57FF004215EA96181FF7CD795EB7FF0020C97EABFF00
      A10AF52B43803FDDAFA7C87F872F53BB0FFC3F9FF916DB155E5651C0E4D24921
      3C2D475EFB91B91BC418E4D466DC558A2A0772A1B61E95A1E1DB93A66A02539F
      29C6D907B7AD454538BE577427AE87A223A4B1874219186411DC57865ED9DDD9
      394BBB69A020903CC8CA83F427AD77BA6EA97563F2C6DBA3FEE374AD51E26529
      86B5C9FF007B8AF3B3DCA28E750873CDC1C6F6D2FBDBFC8C27454B734FC38BE5
      F87B4E5236916B1E47A1DA335C978EF5117F32D940DBA188E588E8CDFF00D6AB
      7A8EB775771989310C678217A9FC6B19A25EB5EBCA6A3495286C925F71AC2293
      B984F6D81922B2F559A1B485E495D51101666638000EA4D6DEB9756F656B24F3
      4891C71A96766380A07524D7CD1F173C7C3548BE60E34B639B4B33956BEC1FF5
      B27758B3D17AB77ACE950751972A9CA89FE237C499278E48F46BB163A7E4A36A
      0C9BA49CF422DD0FDEFF007CF15E71A447E27F109957C39692D8DA393E7DFCAE
      4CB2FF00BF29E4FF00BABD2BB9F86FF0AF52F14DCC7E21F17093C8600C16846D
      2CA3A023F853D147FF00AFD6FC53A5DB7877C2579731411C50D95A3C8A8AA028
      0AA4E00FC2BAF9E14BDD82D4CACE5AC8F16F05FC41F18689E02D23C3F6F7B15D
      AEA1AC35AA35CA17648B3B4ED2083D4E46738AF4AF0E780741863530E8D64847
      43E4293F9F5AF22F09D9193C47F0FB46DB96457BE7F7DE59C7E895F54E8B6204
      438A9C6369A48AA5624F87FE0FD39A1BBDD670118031E58F7AF90FC5FA4D98F1
      2EA719B68485BB946360FEF9AFBDBC11008E0BAE3A91FCABE1EF188FF8AAF56F
      FAFD9BFF004335CB2938C11AC5272670F77E1CB276DD12BC2DD4146AE96C7C27
      F1013C391EA362F0EBBA74809365740487038E15FF00F6539A69506BE98F03E9
      B15BF82B4B84A807ECEA4FE3CD690C4CE24CA9A3E58D075F6D2B5148ACAE6E7C
      37A8C2C4358DE9692CC93D460FCD167FC9AF59F0DFC468A6923D375CB73A5EA2
      EBFBB0CDBA1B8F78E41C11EDD79EF5D07C53F06E8FAFDDD9417D68AE59240245
      E245C00461BFA74AE5BE10FC2BD493C666D6F6E62D47C356A44B1C3711EEFDF6
      72B80785C72491D78C8E6B96BD3C263EA7B29AB4FB9CB520AF667B7F83ED174D
      D2A4D6F500AAE577AEEEC31903F0EA7FFAD5CCF9D36A9AACB7F36EF9CFCA1BAA
      AF61FE7D6AA7C69F1DD9E917B69A1C477D946C3EDD344C18DB67050C8A390AC7
      273DB03D6AD685710CD6F1BC6EAE8EA19594E4107B8AF373D72C3D2861E9AB45
      7E2CCAA68AC8D98502A8A929AA411C53ABE48C028A28A0028A28A0028A28A002
      8A28A0028A28A00AFA8C2D71632C4840723E5CFA8E45771E1CF11689AA4090C9
      771D95FAA812DB4CE15B3ED9FBC3DC571F5E77F10FC27AD78A75AFF893A4523D
      AC60B079021C1E98FCABD9C9ABCE351D35B33B3092BB7067D226CC9198E45615
      1B5ACCBFC39FA57C991E95F14FC34775B2EB702AFF00CF098C8BF9024568D8FC
      61F88FA3B08EF67336DEAB776D83FC857D373B5BA3B790FA759197EF291F5149
      5E1BA47ED177A985D5BC3D0CA3BB412953F91CD75FA57C78F025EE16FEDEFF00
      4F63D4BC3BD47E2BCFE954A6992E0CF43A6C8E91A1791D51472598E00ACED1FC
      65E03D67034FF1369E5DBA23CC236FC9B06B94F88260BDF13C9613C82F34EB6B
      48664855FF007723BB3F2D8FBD80A303A735A423CED244BD373B982E6DE750D0
      4F14AA7BA3861FA54B581A1F803C2F75A3DBDDA69CB6F2CC81D9A162841FA822
      9F7FE0BFB059CD7365AEEAD02C485F68B82E381FED66B7785993CE8DCAAB7B38
      8A32735E3D73E38F15F86F57B56D4AEA2D434C9E6119CC603A827D463915D2FC
      56F114DA7689E4D83017D7CE2DED8938D85812D21F65505BF01EB59FB292972B
      DC7756B9E73F19BC6915DFDA6D9D8B6936526C953A7DB6E472221FEC29E5BDC6
      3B1AC2F837E04B9F12EABFF098F8993CE1236FB485C7CAD8E8C47F747F08FC6B
      9FF0CE8CBE39F1ADBE9F02C9FD83A60C73FC4A0F24FF00B4EDC9EF8FA57D55E1
      FD362B6B78D238D511142AA818000ED5D5564A9479226715CCEECB3A5E9E9044
      3E5AE17F68390C5F0DF56540774B1AC400EA4BB85C7EB5E9DB70B5E61F1DA32F
      A159EE1985753B532FA6DF3475FC715CD4B59A3496C794FC3CD315FE34A42E32
      34AD2523538EFB557F939AFA5B4C8544438AF9F7E17385F8C1E20F34FCE621B7
      3E80A8FF000AFA1F4F65310C5698AF8C9A7B1D3F86140B7B9C7F9E2BE0DF1512
      DE25D4D89C93792E7FEFB35F7AF858661B9FA7F4AF827C53FF00231EA7FF005F
      72FF00E866B0ACBF77135A7BB29C0BE64F1A0EACC07EB5F515830B7D3ADE1046
      238957F215F33F86E3FB478834F87FBF7083F515F41DD5E2C6879A848A9331FE
      206B969A53C3A85E48120B7865763DCF0381EE7A0AE9F41F12F876CBC1505F69
      B7F04B3DEDBF9D144CE16660DCF2A7E6049E3D87D2BC37E22EA10788BC45F649
      E461A368EA67D41C7477FE1887A93803F13E95AFF0C3439AEE7B8F13EA5085BD
      BFFF0054847FA9807DD41E9C01FA545670C05396265F14B45FD7E271D692BDCE
      4FE25683AE58EB171E38D36792796625AFE17F99594E0118EE98182BD874E9C6
      87C30F15416490081D868F73208C46CD936139FF009664FF00CF36FE13EBC57B
      05C69E8D6C54A0208C118AF9F7C61A32781FC6258C45FC3FAA8293C23A0527E6
      51EEA4865FCBD6B87018C86654DE1711BF47FD75318BE6D19F4869F702540735
      7ABCE3E196B13496D2E977B3896F2C5846CFFF003D632331C9FF00025FD41AF4
      385C328AF96C5E1E587AAE9CB746525664945145731214514500145145001451
      45001451450014BE16FF00919352FF00AE317F5A4A3C31FF00231EA5FF005C22
      FEB5EA64FF00EF4BE675613E3F91DD5A6951DDD909BCD647248F6ACCD53C38F2
      A9578E0B95F47507F9D745A19FF895A7D4D3E735F5CDBB9DE792EB7E04D02727
      ED7A1431B1FE244DBFA8AE4354F85BA0CB936B3DCDB1EC036E1FAD7BDDC608C1
      C115917D616936774401F55E2A5D9EE8773E73D4FE16EA31126CAFEDE71D8480
      A1AE93E10E87A9D8C9ACD8DF26D99440E007DC36E5FA57A5DEE8C3930CBF8356
      2D8CB7BE1AF105C6A32E9336A169730245288186F8CA1243007823E63C569439
      61514899DDC5A3D83C32862D02CA36EAB1006A5D6D4C9A45DA0EAD0B0FD2B82D
      3BE267855008EE2E751D331FC37566E147E20115D2D8F8ABC33AAC463B5F1369
      52EF18C7DA155BF23835EB46A425B3395C5AE8780FC658CE9FA5E9CF3E427DB1
      49E3B0E4D737F177C5FA6EBD3DC6A9A24D21B682DD6C2D9994A932499699803C
      8C2AAAFE27DABBCFDA962B73A769167633433CF24CCC12270C718EBC5780EAD1
      18341D3A3E0190CD39FA96D9FF00B4EA34F6B7EC86FE13E8EFD9DFC176F6DE0E
      B5BA8EE203777BFBF9806048CFDD538E9818E3D49AF678B43BD8A31B515C7FB2
      D5F03E8D757962564B3BB9EDDC7468A42A7F4AEE344F8ABF10348DA2D7C4D7AE
      ABD1666F307EB5E6CF11093BC91D0A9B4B43EBB96D2E62FF0059048BF55AE2BE
      25E89FDB7E1CBCD3B7796D2C7846C7DD6072A7F302BCC345FDA47C6769B5750B
      2D3AFD475CA1463F88AEAED7F68DF0E6A0823D73C2B73093D5EDDD641F91C1AA
      84E9DEEA56138CBB1E45757577A6F88EDBC5F6D13F9D0308354B6030C8C06D6C
      8FEEB01C1F502BE80F06F886CF55D3A2BBB49D658A419041E9EC7D0FB579978D
      B5BF877E219CEB3E18D75749D60215921BD85922BA5FEE3E72BF8FFF00AC725A
      2DFA5ADE3CBA16A69A2DEB37CF6AEFBED263FECB7207F9C1AEE9C635D5E2F530
      4DC1EA7D87E0F9D1A2BA3918C0FE46BE0CF15B0FF848B53FFAFB97FF004335EF
      3A37C5CD6741B636FAEF86A758CA9C5C59B6F4638F7E31F8D7CE5A93DDDC5E5C
      4CD0303248CF8C8EE73EB5857A12E48C52B9AD39ABB66DF8030FE2EB127A2317
      3F829AF41F1B6BEF65A6B0B61E65D4CC228101E4B9E0579AF82ADB594D57ED16
      BA64F3BEC2AA00E013DC9E8075AE96EA09F4DBD17B7D731DDEBCCA56D6D233B9
      2D73FC6C7D47A7AD3A58777BCB614EA762A695A3A5D6AF69E192C658A090DCEA
      D2E73E7DC75D99EE074FCFBD7B4E9368218D46315E7FF0F74C4B3D4ED62C9772
      B23C8E7ABB10324D7A9C4815457C9710E2653C4727448E3ACB95A0641B48AF39
      F8C9A0AEB1E15BB8D220F3C2BE743C73B979C0FA8C8FC6BD20F4AC9D6230F130
      3DC578D85AD2A356338EE8CA2ECCF0AF86BAAB4536857CCC59A5F334AB827FD9
      1E6427F004AFD3E95EFDA5C9BE2535F367872236635543D34ED62D65503B6256
      8CFE8715F46684D9B75FA57D0712D35ED21517545D4EE6AD14515F2C64145145
      00145145001451450014514500149E1A38F116A5FF005C22FEB4B4DF0E7FC8C5
      A97FD718BFAD7A993FFBD2F99D385F8CF48D10FF00C4AD3EA69F39A87443FF00
      12B4FA9A7CE6BEB5EE77952735467356E7354673520549CD519CD5B9CD519CD0
      333AFAD6DE6CEF8C67D45737AA787ACE60C4430B9F4741FCEBA79CD519CF5A57
      19E79A9695158B3325A2C6D8C6E033F9579F08D5E4D10498602DA45607919F3A
      53FD457B4EAA81A360402315E3DA8C46DEF0B283E5DBDF4899FEEAB60A8FD1AB
      BB08EF1947C8C6AEE99A4DE1FD3EE63DC88617F54E9F95636A1A0DE5B65A3027
      41DD7AFE55D85BC7247102C32BEA3A53267033CD70495D9D099E7AC0A9218104
      762292BB0BDB7B6B91FBD8D49F5EF58977A495CB5BBEE1FDD6EB50D0CC695011
      52785AC85DF8AEC2D8E7649280EA38DCBD4FE828B88DE3CABA953EF5A1F0FC1F
      F84CECCAFDE05F1F5D8D8AEAC17F151956F819523F146ABA6EA13269D712C506
      F62A8B2103193818E87F2AD44F1FEB613748C8CC07530A1FD715CA051E7E0FA0
      AB4C8BE4B1C7635D15B1752151C53338528CA373ABD33C4DAF78856685EFA682
      04C6447842D9EDF2815B1A5E9F05B72ABF31E4B1E49AC0F002AA58CF27F7A4C7
      E42BA85980EF572AB296E251499D2F83803AFC20768DFF009577D5E77E03937F
      88539E91357A257C3E77FEF6FD11CB89F897A086B37543FBB35A47815CDF8C35
      18F4ED2AE6F253F2C31B3FD70381F8D79B460E7351473A3C32C0191BC44D1F4B
      BD5EDE28FDC99D9BFA57D05A0822D97E95E19E16B4792DB4084AE64BCD4A4BE7
      E3F8631807F3CFE75EEFA32ED8147B57D3712B5174E9F65FD7E46B50D2A28A2B
      E50C428A28A0028A28A0028A28A0028A28A004A8B419163F135EA3901A6B7464
      1EBB4907F9D4A7A5656AF6CF294962768A788EE8E45EAA6BB30188587AEA6F63
      6A13509DD9E8FA5EA90DBDBFD9E7CA8072180C8AB6D7B6D2FF00AB9E36FC6BC9
      97C47ACDAAECB9B486E80FE252518FF4A7A78C2C89C5D5ADD5B1F5D9B87E62BE
      B618BA153691E8A9465B33D3E6607A1CD519CD7196DE23B19B1F65D4D33FDD2F
      83F91AB8358BA0322449056CACF66558D99CD519CD533AD83FEB61FC54D31B53
      B493F8CA9FF6851618B39AA339AB124D1BF28EADF435527352067DF8CA1AF33F
      1158EED627B753B05EC7F267A1997951F523E5FF008157A6DD720D71DE2CB233
      5BB3464ACB19DF191D430E95D186A9ECE69B22A479A264683A97996088C77483
      E561DC9AE9ACBC15AA6ACE0AEEB7627E68522692551EA54602FD0B03ED50FC3F
      D1E1BED4BFE1208CAAB48CB179207FAAB93F7CE3D00CB0F4DC3D2BDE74936DA3
      D8C690C5F41DD8F724D76FD561CEDB31F6AEC7856B3F0D75BB28B7ADD0538F95
      6F206B7F30FF00755B2C99FF007996B87BC8EEACAEE4B3BEB796DAE623878A55
      2ACA719E41F6E6BECAB7BA8754B6920B8B75236E1D1BE65615E0BF1E3C3A96F6
      525DC0B9934C9635121FBCD6D2E70A4F7D8F803D98D675F0B151E68970AAEF66
      7915D2A488432861EF54FC3AE9A778AEC2E8B6D89665DC4F604E3F9135637864
      ACEBE5C7CC3A8E6B8A84FD9D44D9B4D7346C56F11599D3F5CB8B7208F2E568F9
      F6271FA546CDFE8EFF00EE9AE975C8175ED162D6A0E6689161BD51C90470B27D
      08183EE2B9295DA28A48E4054853F8D74E328BE7E75B332A33D3959D3F849FCB
      D214FF0079C9AD8F3FDEB9AD0AE026990AE7B66AFF00DA47AD69611DF7C33937
      F88BE91357A7D7927C24943F88DF9E911AF549A754079AF89CF17FB5BF447262
      7E25E82DC48114E4D794FC52BE9B56BFB4F0B69EEA67BA9019BFD841CF3FCFE8
      3DEBA3F1AF8AA2D36110400DC5ECDF2C10272CC4F00FD2B8FB3B2BBD34C8AF27
      9DE26D547CEE39FB2447A93E87FAE076E7D0C8B2EB4BEB55B48C755FD7919C23
      D4D3F07584573E20B9BDB7C1B4B38974FB5F709F78FE2DF9D7A6D947B2302B0B
      C27A545A7D8C56D126D48D401EFEA4FB9AE9106D18AF2333C5FD6B1129F4E9E8
      4C9DD8EA28A2BCE2028A28A0028A28A0028A28A0028A28A00298C81BA8A7D140
      15A4B48DFA815527D2A17FE015A945529B5B0EE73377E1DB797AC6A4FD2B3DF4
      09E039B6B89A2FF75CD76A403DA9A514F6ADE18AA90D9971A928ECCE2186B96F
      D271281D9D698DA9DEA713D96EF743FE35DB3DB46DD40AAF2E9D13FF0008AEDA
      79B558EECDA38A9ADCE3BFB5ED89F9CC909FF6948FD6A55D4988CC572187FBD9
      ADDB9D121707E4159575E1885892A9B4FA8E2BBA9E709FC48DA38B5D515A4D4E
      603E6556AA71C8DAC6A306990AEC9676DA1BA8030493F8004D3EEB41BA89498A
      6703D0F357BE1769D31F1A39B90ADE5DABB21C721B2A3F9135E9E0F174B11514
      17534FAC424B43AA4B5874D860B3B1876ADB113220EAE413BB3EA4E49AEFB495
      B6D5AC6378E4CA9E558763E86B9AD534F90BACF103B90F2075C53F4CB6532F9D
      6F3DCD94ADF79ADDF6863EA54F15F496B181DFC1696FA65BC92BCC00DB977738
      000AE56C6CAC3C577DAA8D42059B4FBF87C948DF82F1271BC7A7CC4107A8C7B5
      57BF83CD20DEDEDF6A014E4473CA0479F7550335D2784AC268BCCBFB91B5E550
      91A631B507B761D38F6AAB01F24F8DFC3D2F86BC59A86833481DED64C2483F8D
      1806427DCA919F439AE6EED08055860D7AE7ED48F0C3F13AD00C067D26267F73
      E6CA3F9015E5F318A54C120D7855E2A13691DB0778999A4EA975A2DF7DA20219
      082AF1B0CABA9EA08EE0FA56F49A4E89E2584C9A4DC456D3B7DEB3B87DA327FE
      79BFF43CD73D7B6EC879195EC6B3EE11E18DE5898A3AA9208AE8C3E2DC5724B5
      4675295F546D5EF87759D29364967711AA719743B7FEFA1C5502D76BFF002CC9
      FA30A9B47F1C788B4C0AB15ECACA000149C8FC8E47E95D8E9FE2CD7AFA256934
      9B0790F792004FF3AEEA93A315793B1CF792DCA1F0FF005A8F45BB9AEEED6432
      32ED4441926BAFBCD7BC43A9425AD6D174BB5FE2BBBE6DA07D01EA7F3AA513F8
      BEED7103DA5829FF009E312AFEB826AD5B78267BD9166D5F51B9BB71D8B1C7D3
      279FE55E2E2259546A3AD51F33EDBFFC0FBCC6725277664585C416F7AD1680AF
      AB6AF2712EA370BF247EA541FF003F5AECBC23E1D3645EE2E246B8BB98EE9A77
      E4B1F4FA56B68FA05AD8C612085235EB8515BD0C2A80715E1E679D4B14BD9D35
      68F6FEBF23394EE16F10451C54D4515F3E661451450014514500145145001451
      450014514500145145001451450014514500145145002521553DA9D450041340
      8C878159BA74A347F115B5F94062DC525F646E09FE55B06A8EA36CB344CA4020
      8C57560F132C3D68D45D19517667A42DAA4A8B24643A30CAB0E411EB4F8B4B88
      BEE31807D4715C1784BC5773A162C750433D983F2B13CA0F63FE47D2BD174BF1
      1E857D1096DEED307D47F51C57E9585C5D2C5439A9BFF33A934F62CD9E996C8C
      246894B0EEDCD68BB2C685DD82AA8C924E00158FA8F8A343D3E2324F7C800F4F
      F1E95E71E35F18DEF8811F4DD315ED6C58E24933F3CA3D3D87F9F7A58AC652C2
      C39AA3FF00307248F26F8B92C9E2EF887A86AD6EEED68BB60B638C8D883191EC
      5B737E35C75CE8B7B18F9406FD2BDAAD34485630360FCA92E34185C7DC15F1B3
      CE1CE6DB08629C74B1E093DB5EC40878A40BF4C8AAB240F3234215B2C31C0AF7
      0BBF0BC4C490833ED5457C2AA24CED35AC733A7B9B2C5C6DAA3CEBC25E0E2655
      9AE7F7B27618E17FC4D7AA683E1B8A2452631F956A68FA3476EA3E51C7B56F45
      1845000AF3B1B98D4AF2DCE3A955C9F914A0D3628C001455A8EDD57A0153D15E
      63937B995C4000E94B4515220A28A2800A28A2800A28A2800A28A2800A28A280
      0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A46008C1A5A2802
      9DCDA2C80822B3DB4901F7A12ADEAA715B949571A928ECC7730D74852FB9C966
      F53CD685B59AC606055CA5A72A9296EC2E228006051814B456621A514F6A6F94
      B9E82A4A2801AAA074A751450014514500145145001451450014514500145145
      0014514500145145001451450014514500145145001451450014514500145145
      0014514500145145001451450014514500145145001451450014514500145145
      00145145001451450014514500145145007FFFD9}
    Image.TileWidth = 300
    Image.TileHeight = 300
    Image.TransparentColor = 39412793
    Image.TransparentMode = tmFixed
    Clients.Clients = (
      'frmPrincipal')
    Left = 84
    Top = 88
  end
  object dsRecaidas: TDataSource
    DataSet = sdqRecaidas
    Left = 56
    Top = 116
  end
  object sdqRecaidas: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT ex_Recaida, ex_FechaRecaida, ex_BajaMedica, ex_AltaMedica' +
        ', '
      '               ex_CausaFin, tb_Descripcion DescrCausaFin'
      'FROM ctb_Tablas, sex_Expedientes'
      'WHERE ex_Siniestro= :Siniestro'
      '      AND ex_Orden= :Orden'
      '      AND tb_Clave(+)='#39'CATER'#39
      '      AND tb_Codigo(+)=ex_CausaFin'
      'ORDER BY ex_Recaida')
    Left = 28
    Top = 116
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Siniestro'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Orden'
        ParamType = ptInput
      end>
    object sdqRecaidasEX_RECAIDA: TFloatField
      FieldName = 'EX_RECAIDA'
      Required = True
    end
    object sdqRecaidasEX_FECHARECAIDA: TDateTimeField
      FieldName = 'EX_FECHARECAIDA'
    end
    object sdqRecaidasEX_BAJAMEDICA: TDateTimeField
      FieldName = 'EX_BAJAMEDICA'
    end
    object sdqRecaidasEX_ALTAMEDICA: TDateTimeField
      FieldName = 'EX_ALTAMEDICA'
    end
    object sdqRecaidasEX_CAUSAFIN: TStringField
      FieldName = 'EX_CAUSAFIN'
      Size = 10
    end
    object sdqRecaidasDESCRCAUSAFIN: TStringField
      FieldName = 'DESCRCAUSAFIN'
      Size = 150
    end
  end
  object ldgRecaidas: TLookupDialog
    Caption = 'Detalle de Recaidas'
    CharCase = ecNormal
    DataSource = dsRecaidas
    DataField = 'EX_RECAIDA'
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_RECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Recaida'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_FECHARECAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'F.Recaida'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_BAJAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'F.Baja M'#233'd.'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_ALTAMEDICA'
        Title.Alignment = taCenter
        Title.Caption = 'F.Egreso'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EX_CAUSAFIN'
        Title.Alignment = taCenter
        Title.Caption = 'Causa Fin'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRCAUSAFIN'
        Title.Caption = 'Descripci'#243'n'
        Width = 300
        Visible = True
      end>
    AutoFill = False
    ShowButtons = False
    ShowEditor = False
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 0
    MinRows = 8
    OnTitleClick = ldgHistoriaTitleClick
    BottomControl = Sb_BarraDeEstado
    ShowExportar = True
    Top = 116
  end
  object PrintDialog: TPrintDialog
    Left = 84
    Top = 144
  end
  object dlgDetalleAMP: TLookupDialog
    Caption = 'Detalle del Volante'
    CharCase = ecNormal
    DataSource = dsDetalleAMP
    DataField = 'Volante'
    Columns = <
      item
        Expanded = False
        FieldName = 'Volante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUIT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Razon Social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estab.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nombre'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Concepto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lote Est.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prestaci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cant. Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total Prest.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observaciones'
        Width = 200
        Visible = True
      end>
    AutoFill = False
    ShowButtons = True
    ShowEditor = False
    ShowHeaders = True
    AllowCancel = True
    MaxRows = 0
    MinRows = 8
    ShowExportar = True
    Top = 172
  end
  object sdqDetalleVolAMP: TSDQuery
    DatabaseName = 'dbPrincipal'
    Options = []
    SQL.Strings = (
      
        'SELECT df_volante "Volante", df_cuit "CUIT", df_empresa "Razon S' +
        'ocial",'
      '       df_nroestableci "Estab.", df_establecimiento "Nombre",'
      '       df_concepto "Concepto", df_lote "Lote Est.",'
      '       df_prestacion "Prestaci'#243'n", df_fecha "Fecha Prest.",'
      '       df_cantidad "Cant. Prest.", df_valor "Valor Prest.",'
      '       df_total "Total Prest.", df_estado "Estado",'
      '       df_observaciones "Observaciones"'
      '  FROM mdf_detallefacamp'
      ' WHERE df_volante = :pvolante'
      '')
    Left = 28
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pVolante'
        ParamType = ptInput
      end>
  end
  object dsDetalleAMP: TDataSource
    DataSet = sdqDetalleVolAMP
    Left = 56
    Top = 172
  end
  object AdvOfficeHint: TAdvOfficeHint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HintHelpText = 'Press F1 for more help.'
    Version = '1.4.1.0'
    Left = 84
    Top = 172
  end
  object ActionList1: TActionList
    Left = 152
    Top = 8
  end
end
