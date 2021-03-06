centers = [
  ["PPIS Head Office", "-", "info@ppis.sg", "6744 0258", "6748 1417", "Blk 1 Eunos Crescent #01-2509 Singapore 400001"],
  ["IINSPIRASI PPIS", "Azita Abdul Aziz (DSP)", "inspirasi@ppis.sg", "6561 1049", "564 9586",
    "Blk 322 Bukit Batok Street 33 #01-16 Singapore 650322"],
  ["PPIS As-Salaam Family Support Centre", "Nooraini Mohd Razak (CM)", "as-salaam@ppis.sg ", "6745 5862", "6743 2749", 
    "Blk 322 Ubi Ave 1 #01-591 Singapore 400322"],
  ["PPIS Family Service Centre (East)", "Fajariah Saban (CM)", "fsceast@ppis.sg ", "6848 4661", "6848 4752",
    "Blk 41 Chai Chee Street #01-16 Singapore 470136"],
  ["PPIS Family Service Centre (West)", "Kamariah Yusoff (CM)", "1fscwest@ppis.sg ", "6561 3462", "6561 6420", 
    "Blk 301 Bukit Batok St 31 #01-01 Singapore 470136"],
  ["PPPIS Family Therapy Institute", "Maimunah Mosli (Principal Therapist) ", "fti@ppis.sg", "6745 0613", "6745 5923",
    "Blk 1 Eunos Crescent #01-2509 Singapore 400001"],
  ["PPIS Student Care Centre - (Bedok)", "Zaleha Ahmad (Supervisor)", "sccbedok@ppis.sg", "741 4065 ", "6741 2942",
    "Blk 136 Bedok Reservoir Road #01-1425 Singapore 470136"],
  ["PPIS Child Development Centre (Jurong)", "Kalthom Kassim (Supervisor)", "sccjurong@ppis.sg", "6561 9013", 
    "6560 5852", "Blk 520 Jurong West St 52 #01-195 Singapore 640520"],
  ["PPIS Training & Consultancy", "Elianna Osman (Marketing Officer)", "training@ppis.sg", "6745 6843", "6745 5923",
    "Blk 1 Eunos Crescent #01-2509 Singapore 400001"],
  ["PPIS Vista Sakinah", "Fazlinda Faroo (CM)", "vistasakinah@ppis.sg", "6891 3090", "6891 3295",
    "Blk 549 Woodlands Drive 44 #01-86 Singapore 730549"],
  ["PPIS Child Development Centre – Bedok Reservoir", "-", "brc@ppis.sg", "6243 3468", "6243 1558",
    "Blk 709 Bedok Reservoir Road #01-3854 Singapore 470709"],
  ["PPIS Child Development Centre – Bukit Batok", "Zulaihabe Talip (Snr P)", "bbc@ppis.sg", "6467 8958", "6466 7514",
    "21 Bukit Batok East Ave 6 Singapore 659759"],
  ["PPIS Child Development Centre – Jurong", "ZSuzila Jamli (Acting Principal)", "jrc@ppis.sg", "6792 6047", 
    "6792 9750", "Blk 826 Jurong West St. 81 #01-430 Singapore 640826"],
  ["PPIS Child Development Centre – Pasir Ris 1", "Nurhudah Hamzah (P)", "prc1@ppis.sg", "6581 5754", "6584 3039", 
    "Blk 557 Pasir Ris St 51 #01-201 Singapore 510557"],
  ["PPIS Child Development Centre – Pasir Ris 2", "Noor Jamariah (P)", "prc2@ppis.sg", "6582 0697", "6581 4829", 
    "Blk 187 Pasir Ris St 11 #01-88 Singapore 510187"],
  ["PPIS Child Development Centre – Sembawang", "Nur Hidayah Jamari (P)", "sbv@ppis.sg", "6347 2542", "6754 3071",
    "Blk 316 Sembawang Vista #01-191 Singapore 750316"]
]
centers.each do |name, manager_name, email, contact_number, fax_number, address|
  Center.create!(
    name: name,
    manager_name: manager_name,
    email: email,
    contact_number: contact_number,
    fax_number: fax_number,
    address: address
  )
end
