XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 W-Afhandelenleads
v 5 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 A-CANCELLED
v 6 W-Completerenaanvraag
v 7 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__A-CANCELLED
e 5 6 A-CANCELLED__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 W-Completerenaanvraag
v 8 W-Completerenaanvraag
v 9 A-CANCELLED
v 10 W-Completerenaanvraag
v 11 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__A-CANCELLED
e 9 10 A-CANCELLED__W-Completerenaanvraag
e 10 11 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 W-Nabellenoffertes
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 A-APPROVED
v 12 W-Validerenaanvraag
v 13 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Nabellenoffertes
e 8 9 W-Nabellenoffertes__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__A-APPROVED
e 11 12 A-APPROVED__W-Validerenaanvraag
e 12 13 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 W-Completerenaanvraag
v 8 W-Completerenaanvraag
v 9 A-ACCEPTED
v 10 A-FINALIZED
v 11 O-SENT
v 12 W-Completerenaanvraag
v 13 W-Nabellenoffertes
v 14 O-SENT
v 15 W-Nabellenoffertes
v 16 W-Nabellenoffertes
v 17 A-DECLINED
v 18 W-Nabellenoffertes
v 19 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__A-ACCEPTED
e 9 10 A-ACCEPTED__A-FINALIZED
e 10 11 A-FINALIZED__O-SENT
e 11 12 O-SENT__W-Completerenaanvraag
e 12 13 W-Completerenaanvraag__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__O-SENT
e 14 15 O-SENT__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__W-Nabellenoffertes
e 16 17 W-Nabellenoffertes__A-DECLINED
e 17 18 A-DECLINED__W-Nabellenoffertes
e 18 19 W-Nabellenoffertes__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 W-Completerenaanvraag
v 6 A-ACCEPTED
v 7 A-FINALIZED
v 8 O-SENT
v 9 W-Completerenaanvraag
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 W-Nabellenoffertes
v 16 W-Validerenaanvraag
v 17 W-Validerenaanvraag
v 18 W-Nabellenincompletedossiers
v 19 O-SENT
v 20 W-Nabellenincompletedossiers
v 21 W-Nabellenincompletedossiers
v 22 W-Nabellenincompletedossiers
v 23 W-Nabellenincompletedossiers
v 24 W-Nabellenincompletedossiers
v 25 A-APPROVED
v 26 W-Validerenaanvraag
v 27 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__A-ACCEPTED
e 6 7 A-ACCEPTED__A-FINALIZED
e 7 8 A-FINALIZED__O-SENT
e 8 9 O-SENT__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__W-Validerenaanvraag
e 15 18 W-Nabellenoffertes__W-Nabellenincompletedossiers
e 15 25 W-Nabellenoffertes__A-APPROVED
e 16 17 W-Validerenaanvraag__W-Validerenaanvraag
e 17 26 W-Validerenaanvraag__W-Validerenaanvraag
e 18 19 W-Nabellenincompletedossiers__O-SENT
e 19 20 O-SENT__W-Nabellenincompletedossiers
e 20 21 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 21 22 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 22 23 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 23 24 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 24 27 W-Nabellenincompletedossiers__end
e 25 27 A-APPROVED__end
e 26 27 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 W-Afhandelenleads
v 5 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 A-CANCELLED
v 7 W-Completerenaanvraag
v 8 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__A-CANCELLED
e 6 7 A-CANCELLED__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 W-Afhandelenleads
v 5 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 W-Nabellenoffertes
v 9 W-Nabellenoffertes
v 10 W-Validerenaanvraag
v 11 A-DECLINED
v 12 W-Validerenaanvraag
v 13 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Nabellenoffertes
e 8 9 W-Nabellenoffertes__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Validerenaanvraag
e 10 11 W-Validerenaanvraag__A-DECLINED
e 11 12 A-DECLINED__W-Validerenaanvraag
e 12 13 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 W-Completerenaanvraag
v 8 W-Completerenaanvraag
v 9 W-Completerenaanvraag
v 10 W-Completerenaanvraag
v 11 W-Completerenaanvraag
v 12 W-Completerenaanvraag
v 13 W-Completerenaanvraag
v 14 W-Completerenaanvraag
v 15 W-Completerenaanvraag
v 16 W-Completerenaanvraag
v 17 W-Completerenaanvraag
v 18 W-Completerenaanvraag
v 19 W-Completerenaanvraag
v 20 A-DECLINED
v 21 W-Completerenaanvraag
v 22 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__W-Completerenaanvraag
e 10 11 W-Completerenaanvraag__W-Completerenaanvraag
e 11 12 W-Completerenaanvraag__W-Completerenaanvraag
e 12 13 W-Completerenaanvraag__W-Completerenaanvraag
e 13 14 W-Completerenaanvraag__W-Completerenaanvraag
e 14 15 W-Completerenaanvraag__W-Completerenaanvraag
e 15 16 W-Completerenaanvraag__W-Completerenaanvraag
e 16 17 W-Completerenaanvraag__W-Completerenaanvraag
e 17 18 W-Completerenaanvraag__W-Completerenaanvraag
e 18 19 W-Completerenaanvraag__W-Completerenaanvraag
e 19 20 W-Completerenaanvraag__A-DECLINED
e 20 21 A-DECLINED__W-Completerenaanvraag
e 21 22 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 W-Afhandelenleads
v 5 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 A-DECLINED
v 6 W-Completerenaanvraag
v 7 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__A-DECLINED
e 5 6 A-DECLINED__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 W-Afhandelenleads
v 5 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 A-ACCEPTED
v 8 A-FINALIZED
v 9 O-SENT
v 10 W-Completerenaanvraag
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 A-CANCELLED
v 14 W-Nabellenoffertes
v 15 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__A-ACCEPTED
e 7 8 A-ACCEPTED__A-FINALIZED
e 8 9 A-FINALIZED__O-SENT
e 9 10 O-SENT__W-Completerenaanvraag
e 10 11 W-Completerenaanvraag__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__A-CANCELLED
e 13 14 A-CANCELLED__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 W-Nabellenoffertes
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 W-Validerenaanvraag
v 12 A-APPROVED
v 13 W-Validerenaanvraag
v 14 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Nabellenoffertes
e 8 9 W-Nabellenoffertes__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Validerenaanvraag
e 11 12 W-Validerenaanvraag__A-APPROVED
e 12 13 A-APPROVED__W-Validerenaanvraag
e 13 14 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 A-DECLINED
v 6 W-Completerenaanvraag
v 7 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__A-DECLINED
e 5 6 A-DECLINED__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 W-Afhandelenleads
v 4 A-DECLINED
v 5 W-Afhandelenleads
v 6 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__W-Afhandelenleads
e 3 4 W-Afhandelenleads__A-DECLINED
e 4 5 A-DECLINED__W-Afhandelenleads
e 5 6 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 A-CANCELLED
v 8 W-Completerenaanvraag
v 9 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__A-CANCELLED
e 7 8 A-CANCELLED__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 W-Nabellenoffertes
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 W-Validerenaanvraag
v 12 A-APPROVED
v 13 W-Validerenaanvraag
v 14 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Nabellenoffertes
e 8 9 W-Nabellenoffertes__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Validerenaanvraag
e 11 12 W-Validerenaanvraag__A-APPROVED
e 12 13 A-APPROVED__W-Validerenaanvraag
e 13 14 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 A-ACCEPTED
v 6 A-FINALIZED
v 7 O-SENT
v 8 W-Completerenaanvraag
v 9 W-Nabellenoffertes
v 10 A-CANCELLED
v 11 W-Nabellenoffertes
v 12 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__A-ACCEPTED
e 5 6 A-ACCEPTED__A-FINALIZED
e 6 7 A-FINALIZED__O-SENT
e 7 8 O-SENT__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__A-CANCELLED
e 10 11 A-CANCELLED__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 W-Beoordelenfraude
v 4 W-Beoordelenfraude
v 5 A-DECLINED
v 6 W-Beoordelenfraude
v 7 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__W-Beoordelenfraude
e 3 4 W-Beoordelenfraude__W-Beoordelenfraude
e 4 5 W-Beoordelenfraude__A-DECLINED
e 5 6 A-DECLINED__W-Beoordelenfraude
e 6 7 W-Beoordelenfraude__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 W-Afhandelenleads
v 4 W-Afhandelenleads
v 5 A-PREACCEPTED
v 6 W-Afhandelenleads
v 7 W-Completerenaanvraag
v 8 W-Completerenaanvraag
v 9 W-Completerenaanvraag
v 10 A-DECLINED
v 11 W-Completerenaanvraag
v 12 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__W-Afhandelenleads
e 3 4 W-Afhandelenleads__W-Afhandelenleads
e 4 5 W-Afhandelenleads__A-PREACCEPTED
e 5 6 A-PREACCEPTED__W-Afhandelenleads
e 6 7 W-Afhandelenleads__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__A-DECLINED
e 10 11 A-DECLINED__W-Completerenaanvraag
e 11 12 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 A-ACCEPTED
v 7 A-FINALIZED
v 8 O-SENT
v 9 W-Completerenaanvraag
v 10 O-SENT
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 W-Nabellenoffertes
v 16 W-Nabellenoffertes
v 17 W-Nabellenoffertes
v 18 W-Nabellenoffertes
v 19 W-Validerenaanvraag
v 20 W-Nabellenincompletedossiers
v 21 W-Nabellenincompletedossiers
v 22 W-Nabellenincompletedossiers
v 23 W-Nabellenincompletedossiers
v 24 W-Nabellenincompletedossiers
v 25 W-Nabellenincompletedossiers
v 26 W-Nabellenincompletedossiers
v 27 W-Validerenaanvraag
v 28 W-Nabellenincompletedossiers
v 29 W-Nabellenincompletedossiers
v 30 W-Nabellenincompletedossiers
v 31 W-Nabellenincompletedossiers
v 32 W-Nabellenincompletedossiers
v 33 W-Nabellenincompletedossiers
v 34 W-Nabellenincompletedossiers
v 35 W-Nabellenincompletedossiers
v 36 W-Nabellenincompletedossiers
v 37 W-Nabellenincompletedossiers
v 38 W-Nabellenincompletedossiers
v 39 W-Nabellenincompletedossiers
v 40 W-Nabellenincompletedossiers
v 41 W-Nabellenincompletedossiers
v 42 W-Nabellenincompletedossiers
v 43 W-Nabellenincompletedossiers
v 44 W-Nabellenincompletedossiers
v 45 W-Nabellenincompletedossiers
v 46 W-Nabellenincompletedossiers
v 47 W-Nabellenincompletedossiers
v 48 W-Nabellenincompletedossiers
v 49 W-Nabellenincompletedossiers
v 50 W-Nabellenincompletedossiers
v 51 W-Nabellenincompletedossiers
v 52 A-APPROVED
v 53 W-Validerenaanvraag
v 54 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__A-ACCEPTED
e 6 7 A-ACCEPTED__A-FINALIZED
e 7 8 A-FINALIZED__O-SENT
e 8 9 O-SENT__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__O-SENT
e 10 11 O-SENT__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__W-Nabellenoffertes
e 16 17 W-Nabellenoffertes__W-Nabellenoffertes
e 17 18 W-Nabellenoffertes__W-Nabellenoffertes
e 18 19 W-Nabellenoffertes__W-Validerenaanvraag
e 18 20 W-Nabellenoffertes__W-Nabellenincompletedossiers
e 18 52 W-Nabellenoffertes__A-APPROVED
e 19 27 W-Validerenaanvraag__W-Validerenaanvraag
e 20 21 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 21 22 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 22 23 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 23 24 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 24 25 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 25 26 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 26 28 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 27 53 W-Validerenaanvraag__W-Validerenaanvraag
e 28 29 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 29 30 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 30 31 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 31 32 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 32 33 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 33 34 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 34 35 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 35 36 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 36 37 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 37 38 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 38 39 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 39 40 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 40 41 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 41 42 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 42 43 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 43 44 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 44 45 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 45 46 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 46 47 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 47 48 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 48 49 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 49 50 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 50 51 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 51 54 W-Nabellenincompletedossiers__end
e 52 54 A-APPROVED__end
e 53 54 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-DECLINED
v 5 W-Completerenaanvraag
v 6 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-DECLINED
e 4 5 A-DECLINED__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 A-ACCEPTED
v 6 A-FINALIZED
v 7 O-SENT
v 8 W-Completerenaanvraag
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 A-DECLINED
v 12 W-Validerenaanvraag
v 13 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__A-ACCEPTED
e 5 6 A-ACCEPTED__A-FINALIZED
e 6 7 A-FINALIZED__O-SENT
e 7 8 O-SENT__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__A-DECLINED
e 11 12 A-DECLINED__W-Validerenaanvraag
e 12 13 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 A-ACCEPTED
v 7 A-FINALIZED
v 8 O-SENT
v 9 W-Completerenaanvraag
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 A-CANCELLED
v 16 W-Nabellenoffertes
v 17 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__A-ACCEPTED
e 6 7 A-ACCEPTED__A-FINALIZED
e 7 8 A-FINALIZED__O-SENT
e 8 9 O-SENT__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__A-CANCELLED
e 15 16 A-CANCELLED__W-Nabellenoffertes
e 16 17 W-Nabellenoffertes__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 W-Afhandelenleads
v 5 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 W-Afhandelenleads
v 4 A-PREACCEPTED
v 5 W-Afhandelenleads
v 6 W-Completerenaanvraag
v 7 W-Completerenaanvraag
v 8 W-Completerenaanvraag
v 9 W-Completerenaanvraag
v 10 A-DECLINED
v 11 W-Completerenaanvraag
v 12 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__W-Afhandelenleads
e 3 4 W-Afhandelenleads__A-PREACCEPTED
e 4 5 A-PREACCEPTED__W-Afhandelenleads
e 5 6 W-Afhandelenleads__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__A-DECLINED
e 10 11 A-DECLINED__W-Completerenaanvraag
e 11 12 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 W-Afhandelenleads
v 5 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 W-Completerenaanvraag
v 8 W-Completerenaanvraag
v 9 A-ACCEPTED
v 10 A-FINALIZED
v 11 O-SENT
v 12 W-Completerenaanvraag
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 W-Nabellenoffertes
v 16 W-Validerenaanvraag
v 17 A-DECLINED
v 18 W-Validerenaanvraag
v 19 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__A-ACCEPTED
e 9 10 A-ACCEPTED__A-FINALIZED
e 10 11 A-FINALIZED__O-SENT
e 11 12 O-SENT__W-Completerenaanvraag
e 12 13 W-Completerenaanvraag__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__W-Validerenaanvraag
e 16 17 W-Validerenaanvraag__A-DECLINED
e 17 18 A-DECLINED__W-Validerenaanvraag
e 18 19 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 W-Afhandelenleads
v 5 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 A-DECLINED
v 8 W-Completerenaanvraag
v 9 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__A-DECLINED
e 7 8 A-DECLINED__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 A-ACCEPTED
v 6 A-FINALIZED
v 7 O-SENT
v 8 W-Completerenaanvraag
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 W-Nabellenoffertes
v 16 W-Nabellenoffertes
v 17 W-Nabellenoffertes
v 18 W-Nabellenoffertes
v 19 W-Nabellenoffertes
v 20 W-Nabellenoffertes
v 21 W-Nabellenoffertes
v 22 A-CANCELLED
v 23 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__A-ACCEPTED
e 5 6 A-ACCEPTED__A-FINALIZED
e 6 7 A-FINALIZED__O-SENT
e 7 8 O-SENT__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__W-Nabellenoffertes
e 16 17 W-Nabellenoffertes__W-Nabellenoffertes
e 17 18 W-Nabellenoffertes__W-Nabellenoffertes
e 18 19 W-Nabellenoffertes__W-Nabellenoffertes
e 19 20 W-Nabellenoffertes__W-Nabellenoffertes
e 20 21 W-Nabellenoffertes__W-Nabellenoffertes
e 21 22 W-Nabellenoffertes__A-CANCELLED
e 22 23 A-CANCELLED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-DECLINED
v 4 W-Afhandelenleads
v 5 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-DECLINED
e 3 4 A-DECLINED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 W-Afhandelenleads
v 4 A-PREACCEPTED
v 5 W-Afhandelenleads
v 6 A-DECLINED
v 7 W-Completerenaanvraag
v 8 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__W-Afhandelenleads
e 3 4 W-Afhandelenleads__A-PREACCEPTED
e 4 5 A-PREACCEPTED__W-Afhandelenleads
e 5 6 W-Afhandelenleads__A-DECLINED
e 6 7 A-DECLINED__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 W-Completerenaanvraag
v 6 A-DECLINED
v 7 W-Completerenaanvraag
v 8 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__A-DECLINED
e 6 7 A-DECLINED__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 A-ACCEPTED
v 6 A-FINALIZED
v 7 O-SENT
v 8 W-Completerenaanvraag
v 9 W-Nabellenoffertes
v 10 A-APPROVED
v 11 W-Validerenaanvraag
v 12 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__A-ACCEPTED
e 5 6 A-ACCEPTED__A-FINALIZED
e 6 7 A-FINALIZED__O-SENT
e 7 8 O-SENT__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__A-APPROVED
e 10 11 A-APPROVED__W-Validerenaanvraag
e 11 12 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 W-Completerenaanvraag
v 8 W-Completerenaanvraag
v 9 W-Completerenaanvraag
v 10 W-Completerenaanvraag
v 11 W-Completerenaanvraag
v 12 W-Completerenaanvraag
v 13 W-Completerenaanvraag
v 14 W-Completerenaanvraag
v 15 A-CANCELLED
v 16 W-Completerenaanvraag
v 17 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__W-Completerenaanvraag
e 10 11 W-Completerenaanvraag__W-Completerenaanvraag
e 11 12 W-Completerenaanvraag__W-Completerenaanvraag
e 12 13 W-Completerenaanvraag__W-Completerenaanvraag
e 13 14 W-Completerenaanvraag__W-Completerenaanvraag
e 14 15 W-Completerenaanvraag__A-CANCELLED
e 15 16 A-CANCELLED__W-Completerenaanvraag
e 16 17 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 A-ACCEPTED
v 6 A-FINALIZED
v 7 O-SENT
v 8 W-Completerenaanvraag
v 9 W-Nabellenoffertes
v 10 A-CANCELLED
v 11 W-Nabellenoffertes
v 12 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__A-ACCEPTED
e 5 6 A-ACCEPTED__A-FINALIZED
e 6 7 A-FINALIZED__O-SENT
e 7 8 O-SENT__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__A-CANCELLED
e 10 11 A-CANCELLED__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 A-ACCEPTED
v 7 A-FINALIZED
v 8 O-SENT
v 9 W-Completerenaanvraag
v 10 W-Nabellenoffertes
v 11 A-APPROVED
v 12 W-Validerenaanvraag
v 13 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__A-ACCEPTED
e 6 7 A-ACCEPTED__A-FINALIZED
e 7 8 A-FINALIZED__O-SENT
e 8 9 O-SENT__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__A-APPROVED
e 11 12 A-APPROVED__W-Validerenaanvraag
e 12 13 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 W-Completerenaanvraag
v 8 A-CANCELLED
v 9 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__A-CANCELLED
e 8 9 A-CANCELLED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 O-SENT
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 W-Nabellenoffertes
v 16 A-CANCELLED
v 17 W-Nabellenoffertes
v 18 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__O-SENT
e 8 9 O-SENT__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__A-CANCELLED
e 16 17 A-CANCELLED__W-Nabellenoffertes
e 17 18 W-Nabellenoffertes__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 A-ACCEPTED
v 6 A-FINALIZED
v 7 O-SENT
v 8 W-Completerenaanvraag
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 A-DECLINED
v 14 W-Validerenaanvraag
v 15 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__A-ACCEPTED
e 5 6 A-ACCEPTED__A-FINALIZED
e 6 7 A-FINALIZED__O-SENT
e 7 8 O-SENT__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__A-DECLINED
e 13 14 A-DECLINED__W-Validerenaanvraag
e 14 15 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 A-DECLINED
v 8 W-Completerenaanvraag
v 9 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__A-DECLINED
e 7 8 A-DECLINED__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 A-ACCEPTED
v 6 A-FINALIZED
v 7 O-SENT
v 8 W-Completerenaanvraag
v 9 A-CANCELLED
v 10 W-Nabellenoffertes
v 11 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__A-ACCEPTED
e 5 6 A-ACCEPTED__A-FINALIZED
e 6 7 A-FINALIZED__O-SENT
e 7 8 O-SENT__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__A-CANCELLED
e 9 10 A-CANCELLED__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 A-ACCEPTED
v 6 A-FINALIZED
v 7 O-SENT
v 8 W-Completerenaanvraag
v 9 W-Nabellenoffertes
v 10 O-SENT
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Validerenaanvraag
v 15 W-Validerenaanvraag
v 16 A-APPROVED
v 17 W-Validerenaanvraag
v 18 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__A-ACCEPTED
e 5 6 A-ACCEPTED__A-FINALIZED
e 6 7 A-FINALIZED__O-SENT
e 7 8 O-SENT__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__O-SENT
e 10 11 O-SENT__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Validerenaanvraag
e 14 15 W-Validerenaanvraag__W-Validerenaanvraag
e 15 16 W-Validerenaanvraag__A-APPROVED
e 16 17 A-APPROVED__W-Validerenaanvraag
e 17 18 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 W-Nabellenoffertes
v 9 A-DECLINED
v 10 W-Validerenaanvraag
v 11 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Nabellenoffertes
e 8 9 W-Nabellenoffertes__A-DECLINED
e 9 10 A-DECLINED__W-Validerenaanvraag
e 10 11 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 O-SENT
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 A-DECLINED
v 13 W-Validerenaanvraag
v 14 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__O-SENT
e 8 9 O-SENT__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__A-DECLINED
e 12 13 A-DECLINED__W-Validerenaanvraag
e 13 14 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 W-Completerenaanvraag
v 8 W-Completerenaanvraag
v 9 W-Completerenaanvraag
v 10 W-Completerenaanvraag
v 11 W-Completerenaanvraag
v 12 W-Completerenaanvraag
v 13 W-Completerenaanvraag
v 14 W-Completerenaanvraag
v 15 W-Completerenaanvraag
v 16 W-Completerenaanvraag
v 17 W-Completerenaanvraag
v 18 W-Completerenaanvraag
v 19 W-Completerenaanvraag
v 20 W-Beoordelenfraude
v 21 A-DECLINED
v 22 W-Beoordelenfraude
v 23 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__W-Completerenaanvraag
e 10 11 W-Completerenaanvraag__W-Completerenaanvraag
e 11 12 W-Completerenaanvraag__W-Completerenaanvraag
e 12 13 W-Completerenaanvraag__W-Completerenaanvraag
e 13 14 W-Completerenaanvraag__W-Completerenaanvraag
e 14 15 W-Completerenaanvraag__W-Completerenaanvraag
e 15 16 W-Completerenaanvraag__W-Completerenaanvraag
e 16 17 W-Completerenaanvraag__W-Completerenaanvraag
e 17 18 W-Completerenaanvraag__W-Completerenaanvraag
e 18 19 W-Completerenaanvraag__W-Completerenaanvraag
e 19 20 W-Completerenaanvraag__W-Beoordelenfraude
e 20 21 W-Beoordelenfraude__A-DECLINED
e 21 22 A-DECLINED__W-Beoordelenfraude
e 22 23 W-Beoordelenfraude__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 W-Nabellenoffertes
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 A-APPROVED
v 12 W-Validerenaanvraag
v 13 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Nabellenoffertes
e 8 9 W-Nabellenoffertes__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__A-APPROVED
e 11 12 A-APPROVED__W-Validerenaanvraag
e 12 13 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 W-Completerenaanvraag
v 8 W-Completerenaanvraag
v 9 W-Completerenaanvraag
v 10 W-Completerenaanvraag
v 11 A-ACCEPTED
v 12 A-FINALIZED
v 13 O-SENT
v 14 W-Completerenaanvraag
v 15 W-Nabellenoffertes
v 16 W-Nabellenoffertes
v 17 W-Nabellenoffertes
v 18 W-Nabellenoffertes
v 19 W-Validerenaanvraag
v 20 W-Nabellenincompletedossiers
v 21 W-Nabellenincompletedossiers
v 22 W-Nabellenincompletedossiers
v 23 W-Nabellenincompletedossiers
v 24 W-Nabellenincompletedossiers
v 25 W-Nabellenincompletedossiers
v 26 W-Nabellenincompletedossiers
v 27 W-Validerenaanvraag
v 28 W-Nabellenincompletedossiers
v 29 W-Nabellenincompletedossiers
v 30 W-Validerenaanvraag
v 31 W-Validerenaanvraag
v 32 W-Nabellenincompletedossiers
v 33 W-Nabellenincompletedossiers
v 34 W-Nabellenincompletedossiers
v 35 W-Nabellenincompletedossiers
v 36 W-Nabellenincompletedossiers
v 37 W-Nabellenincompletedossiers
v 38 W-Nabellenincompletedossiers
v 39 W-Nabellenincompletedossiers
v 40 W-Nabellenincompletedossiers
v 41 W-Nabellenincompletedossiers
v 42 W-Nabellenincompletedossiers
v 43 W-Nabellenincompletedossiers
v 44 W-Nabellenincompletedossiers
v 45 W-Nabellenincompletedossiers
v 46 W-Nabellenincompletedossiers
v 47 W-Validerenaanvraag
v 48 W-Validerenaanvraag
v 49 A-APPROVED
v 50 W-Validerenaanvraag
v 51 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__W-Completerenaanvraag
e 10 11 W-Completerenaanvraag__A-ACCEPTED
e 11 12 A-ACCEPTED__A-FINALIZED
e 12 13 A-FINALIZED__O-SENT
e 13 14 O-SENT__W-Completerenaanvraag
e 14 15 W-Completerenaanvraag__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__W-Nabellenoffertes
e 16 17 W-Nabellenoffertes__W-Nabellenoffertes
e 17 18 W-Nabellenoffertes__W-Nabellenoffertes
e 18 19 W-Nabellenoffertes__W-Validerenaanvraag
e 18 20 W-Nabellenoffertes__W-Nabellenincompletedossiers
e 18 49 W-Nabellenoffertes__A-APPROVED
e 19 27 W-Validerenaanvraag__W-Validerenaanvraag
e 20 21 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 21 22 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 22 23 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 23 24 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 24 25 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 25 26 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 26 28 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 27 30 W-Validerenaanvraag__W-Validerenaanvraag
e 28 29 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 29 32 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 30 31 W-Validerenaanvraag__W-Validerenaanvraag
e 31 47 W-Validerenaanvraag__W-Validerenaanvraag
e 32 33 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 33 34 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 34 35 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 35 36 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 36 37 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 37 38 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 38 39 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 39 40 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 40 41 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 41 42 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 42 43 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 43 44 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 44 45 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 45 46 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 46 51 W-Nabellenincompletedossiers__end
e 47 48 W-Validerenaanvraag__W-Validerenaanvraag
e 48 50 W-Validerenaanvraag__W-Validerenaanvraag
e 49 51 A-APPROVED__end
e 50 51 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 A-ACCEPTED
v 8 A-FINALIZED
v 9 O-SENT
v 10 W-Completerenaanvraag
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 W-Nabellenoffertes
v 16 W-Nabellenoffertes
v 17 W-Nabellenoffertes
v 18 W-Nabellenoffertes
v 19 W-Validerenaanvraag
v 20 W-Nabellenincompletedossiers
v 21 W-Nabellenincompletedossiers
v 22 W-Nabellenincompletedossiers
v 23 W-Nabellenincompletedossiers
v 24 W-Validerenaanvraag
v 25 W-Nabellenincompletedossiers
v 26 W-Nabellenincompletedossiers
v 27 W-Validerenaanvraag
v 28 W-Nabellenincompletedossiers
v 29 W-Nabellenincompletedossiers
v 30 W-Nabellenincompletedossiers
v 31 W-Validerenaanvraag
v 32 W-Validerenaanvraag
v 33 A-APPROVED
v 34 W-Validerenaanvraag
v 35 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__A-ACCEPTED
e 7 8 A-ACCEPTED__A-FINALIZED
e 8 9 A-FINALIZED__O-SENT
e 9 10 O-SENT__W-Completerenaanvraag
e 10 11 W-Completerenaanvraag__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__W-Nabellenoffertes
e 16 17 W-Nabellenoffertes__W-Nabellenoffertes
e 17 18 W-Nabellenoffertes__W-Nabellenoffertes
e 18 19 W-Nabellenoffertes__W-Validerenaanvraag
e 18 20 W-Nabellenoffertes__W-Nabellenincompletedossiers
e 18 33 W-Nabellenoffertes__A-APPROVED
e 19 24 W-Validerenaanvraag__W-Validerenaanvraag
e 20 21 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 21 22 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 22 23 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 23 25 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 24 27 W-Validerenaanvraag__W-Validerenaanvraag
e 25 26 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 26 28 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 27 31 W-Validerenaanvraag__W-Validerenaanvraag
e 28 29 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 29 30 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 30 35 W-Nabellenincompletedossiers__end
e 31 32 W-Validerenaanvraag__W-Validerenaanvraag
e 32 34 W-Validerenaanvraag__W-Validerenaanvraag
e 33 35 A-APPROVED__end
e 34 35 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 W-Nabellenoffertes
v 9 O-SENT
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 W-Validerenaanvraag
v 16 W-Nabellenincompletedossiers
v 17 W-Nabellenincompletedossiers
v 18 W-Nabellenincompletedossiers
v 19 W-Nabellenincompletedossiers
v 20 W-Nabellenincompletedossiers
v 21 W-Nabellenincompletedossiers
v 22 W-Nabellenincompletedossiers
v 23 W-Nabellenincompletedossiers
v 24 W-Nabellenincompletedossiers
v 25 W-Nabellenincompletedossiers
v 26 W-Nabellenincompletedossiers
v 27 W-Validerenaanvraag
v 28 W-Nabellenincompletedossiers
v 29 W-Nabellenincompletedossiers
v 30 W-Nabellenincompletedossiers
v 31 W-Nabellenincompletedossiers
v 32 W-Nabellenincompletedossiers
v 33 A-APPROVED
v 34 W-Validerenaanvraag
v 35 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Nabellenoffertes
e 8 9 W-Nabellenoffertes__O-SENT
e 9 10 O-SENT__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__W-Validerenaanvraag
e 14 16 W-Nabellenoffertes__W-Nabellenincompletedossiers
e 14 33 W-Nabellenoffertes__A-APPROVED
e 15 27 W-Validerenaanvraag__W-Validerenaanvraag
e 16 17 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 17 18 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 18 19 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 19 20 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 20 21 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 21 22 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 22 23 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 23 24 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 24 25 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 25 26 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 26 28 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 27 34 W-Validerenaanvraag__W-Validerenaanvraag
e 28 29 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 29 30 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 30 31 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 31 32 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 32 35 W-Nabellenincompletedossiers__end
e 33 35 A-APPROVED__end
e 34 35 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 A-ACCEPTED
v 6 A-FINALIZED
v 7 O-SENT
v 8 W-Completerenaanvraag
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Validerenaanvraag
v 13 W-Nabellenincompletedossiers
v 14 W-Validerenaanvraag
v 15 A-APPROVED
v 16 W-Validerenaanvraag
v 17 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__A-ACCEPTED
e 5 6 A-ACCEPTED__A-FINALIZED
e 6 7 A-FINALIZED__O-SENT
e 7 8 O-SENT__W-Completerenaanvraag
e 8 9 W-Completerenaanvraag__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Validerenaanvraag
e 11 13 W-Nabellenoffertes__W-Nabellenincompletedossiers
e 11 15 W-Nabellenoffertes__A-APPROVED
e 12 14 W-Validerenaanvraag__W-Validerenaanvraag
e 13 17 W-Nabellenincompletedossiers__end
e 14 16 W-Validerenaanvraag__W-Validerenaanvraag
e 15 17 A-APPROVED__end
e 16 17 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 A-ACCEPTED
v 7 A-FINALIZED
v 8 O-SENT
v 9 W-Completerenaanvraag
v 10 O-SENT
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Validerenaanvraag
v 14 W-Nabellenincompletedossiers
v 15 W-Nabellenincompletedossiers
v 16 W-Nabellenincompletedossiers
v 17 O-SENT
v 18 W-Nabellenincompletedossiers
v 19 W-Nabellenincompletedossiers
v 20 W-Nabellenincompletedossiers
v 21 A-APPROVED
v 22 W-Validerenaanvraag
v 23 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__A-ACCEPTED
e 6 7 A-ACCEPTED__A-FINALIZED
e 7 8 A-FINALIZED__O-SENT
e 8 9 O-SENT__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__O-SENT
e 10 11 O-SENT__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Validerenaanvraag
e 12 14 W-Nabellenoffertes__W-Nabellenincompletedossiers
e 12 21 W-Nabellenoffertes__A-APPROVED
e 13 22 W-Validerenaanvraag__W-Validerenaanvraag
e 14 15 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 15 16 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 16 17 W-Nabellenincompletedossiers__O-SENT
e 17 18 O-SENT__W-Nabellenincompletedossiers
e 18 19 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 19 20 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 20 23 W-Nabellenincompletedossiers__end
e 21 23 A-APPROVED__end
e 22 23 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 A-ACCEPTED
v 7 A-FINALIZED
v 8 O-SENT
v 9 W-Completerenaanvraag
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Validerenaanvraag
v 14 W-Validerenaanvraag
v 15 W-Nabellenincompletedossiers
v 16 W-Nabellenincompletedossiers
v 17 W-Nabellenincompletedossiers
v 18 W-Nabellenincompletedossiers
v 19 W-Nabellenincompletedossiers
v 20 W-Nabellenincompletedossiers
v 21 A-APPROVED
v 22 W-Validerenaanvraag
v 23 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__A-ACCEPTED
e 6 7 A-ACCEPTED__A-FINALIZED
e 7 8 A-FINALIZED__O-SENT
e 8 9 O-SENT__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Validerenaanvraag
e 12 15 W-Nabellenoffertes__W-Nabellenincompletedossiers
e 12 21 W-Nabellenoffertes__A-APPROVED
e 13 14 W-Validerenaanvraag__W-Validerenaanvraag
e 14 22 W-Validerenaanvraag__W-Validerenaanvraag
e 15 16 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 16 17 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 17 18 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 18 19 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 19 20 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 20 23 W-Nabellenincompletedossiers__end
e 21 23 A-APPROVED__end
e 22 23 W-Validerenaanvraag__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 A-ACCEPTED
v 5 A-FINALIZED
v 6 O-SENT
v 7 W-Completerenaanvraag
v 8 W-Nabellenoffertes
v 9 W-Nabellenoffertes
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Validerenaanvraag
v 13 W-Nabellenincompletedossiers
v 14 W-Nabellenincompletedossiers
v 15 W-Nabellenincompletedossiers
v 16 A-DECLINED
v 17 W-Nabellenincompletedossiers
v 18 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__A-ACCEPTED
e 4 5 A-ACCEPTED__A-FINALIZED
e 5 6 A-FINALIZED__O-SENT
e 6 7 O-SENT__W-Completerenaanvraag
e 7 8 W-Completerenaanvraag__W-Nabellenoffertes
e 8 9 W-Nabellenoffertes__W-Nabellenoffertes
e 9 10 W-Nabellenoffertes__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Validerenaanvraag
e 11 13 W-Nabellenoffertes__W-Nabellenincompletedossiers
e 11 18 W-Nabellenoffertes__end
e 12 18 W-Validerenaanvraag__end
e 13 14 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 14 15 W-Nabellenincompletedossiers__W-Nabellenincompletedossiers
e 15 16 W-Nabellenincompletedossiers__A-DECLINED
e 16 17 A-DECLINED__W-Nabellenincompletedossiers
e 17 18 W-Nabellenincompletedossiers__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Afhandelenleads
v 5 W-Completerenaanvraag
v 6 A-ACCEPTED
v 7 A-FINALIZED
v 8 O-SENT
v 9 W-Completerenaanvraag
v 10 W-Nabellenoffertes
v 11 W-Nabellenoffertes
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 W-Nabellenoffertes
v 16 W-Nabellenoffertes
v 17 W-Nabellenoffertes
v 18 W-Nabellenoffertes
v 19 W-Nabellenoffertes
v 20 W-Nabellenoffertes
v 21 W-Nabellenoffertes
v 22 W-Nabellenoffertes
v 23 W-Nabellenoffertes
v 24 W-Nabellenoffertes
v 25 A-CANCELLED
v 26 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Afhandelenleads
e 4 5 W-Afhandelenleads__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__A-ACCEPTED
e 6 7 A-ACCEPTED__A-FINALIZED
e 7 8 A-FINALIZED__O-SENT
e 8 9 O-SENT__W-Completerenaanvraag
e 9 10 W-Completerenaanvraag__W-Nabellenoffertes
e 10 11 W-Nabellenoffertes__W-Nabellenoffertes
e 11 12 W-Nabellenoffertes__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__W-Nabellenoffertes
e 16 17 W-Nabellenoffertes__W-Nabellenoffertes
e 17 18 W-Nabellenoffertes__W-Nabellenoffertes
e 18 19 W-Nabellenoffertes__W-Nabellenoffertes
e 19 20 W-Nabellenoffertes__W-Nabellenoffertes
e 20 21 W-Nabellenoffertes__W-Nabellenoffertes
e 21 22 W-Nabellenoffertes__W-Nabellenoffertes
e 22 23 W-Nabellenoffertes__W-Nabellenoffertes
e 23 24 W-Nabellenoffertes__W-Nabellenoffertes
e 24 25 W-Nabellenoffertes__A-CANCELLED
e 25 26 A-CANCELLED__end

XP 
v 1 start
v 2 A-SUBMITTED
v 3 A-PREACCEPTED
v 4 W-Completerenaanvraag
v 5 W-Completerenaanvraag
v 6 W-Completerenaanvraag
v 7 A-ACCEPTED
v 8 A-FINALIZED
v 9 O-SENT
v 10 W-Completerenaanvraag
v 11 O-SENT
v 12 W-Nabellenoffertes
v 13 W-Nabellenoffertes
v 14 W-Nabellenoffertes
v 15 W-Nabellenoffertes
v 16 O-SENT
v 17 W-Nabellenoffertes
v 18 W-Nabellenoffertes
v 19 W-Nabellenoffertes
v 20 W-Nabellenoffertes
v 21 W-Nabellenoffertes
v 22 W-Nabellenoffertes
v 23 W-Nabellenoffertes
v 24 A-APPROVED
v 25 W-Validerenaanvraag
v 26 end
e 1 2 start__A-SUBMITTED
e 2 3 A-SUBMITTED__A-PREACCEPTED
e 3 4 A-PREACCEPTED__W-Completerenaanvraag
e 4 5 W-Completerenaanvraag__W-Completerenaanvraag
e 5 6 W-Completerenaanvraag__W-Completerenaanvraag
e 6 7 W-Completerenaanvraag__A-ACCEPTED
e 7 8 A-ACCEPTED__A-FINALIZED
e 8 9 A-FINALIZED__O-SENT
e 9 10 O-SENT__W-Completerenaanvraag
e 10 11 W-Completerenaanvraag__O-SENT
e 11 12 O-SENT__W-Nabellenoffertes
e 12 13 W-Nabellenoffertes__W-Nabellenoffertes
e 13 14 W-Nabellenoffertes__W-Nabellenoffertes
e 14 15 W-Nabellenoffertes__W-Nabellenoffertes
e 15 16 W-Nabellenoffertes__O-SENT
e 16 17 O-SENT__W-Nabellenoffertes
e 17 18 W-Nabellenoffertes__W-Nabellenoffertes
e 18 19 W-Nabellenoffertes__W-Nabellenoffertes
e 19 20 W-Nabellenoffertes__W-Nabellenoffertes
e 20 21 W-Nabellenoffertes__W-Nabellenoffertes
e 21 22 W-Nabellenoffertes__W-Nabellenoffertes
e 22 23 W-Nabellenoffertes__W-Nabellenoffertes
e 23 24 W-Nabellenoffertes__A-APPROVED
e 24 25 A-APPROVED__W-Validerenaanvraag
e 25 26 W-Validerenaanvraag__end

