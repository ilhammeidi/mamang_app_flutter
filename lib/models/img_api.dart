class ImgApi {
  static List<String> photo = [
    // Food
    '',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757163/1_rthm2j.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757162/2_drwuma.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757162/3_oa2qcb.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757161/4_igmhlu.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757159/5_rgtmnk.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757164/6_csioir.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757164/7_trxa2j.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757160/8_fkgug2.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757161/9_n6bwog.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757163/10_bxcnjc.webp',
    // Drink
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757139/11_itpabv.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757139/12_sfafsp.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757139/13_lxf5uz.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757140/14_ropdjc.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757137/15_q8xk16.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757144/16_faggj6.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757140/17_tcxtbc.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757139/18_fcwtaj.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757139/19_ouzr7y.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757140/20_n7hncw.webp',
    // Services
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757190/21_eya8pr.png',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757187/22_iarir9.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757186/23_alnc14.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757189/24_dbjxxq.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757187/25_zpsl0t.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757191/26_kmqvkw.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757189/27_tbiwiy.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757191/28_pn5dof.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757188/29_no1mig.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757190/30_lsxohp.webp',
    // Otomotif
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757178/31_vfu4qn.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757178/32_jylyul.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757177/33_cmiuas.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757176/34_lvk9hw.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757175/35_hzbwqm.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757180/36_n3swzc.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757179/37_xa99ae.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757177/38_tstr5k.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757175/39_tujgal.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757179/40_t7iss1.webp',
    // Property
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757185/41_qycrem.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757181/42_vrgu6a.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757181/43_qiut59.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757183/44_rezck4.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757183/45_jij1tb.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757184/46_slre0z.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757185/47_yhicle.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757182/48_nsscax.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757184/49_urblbs.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757181/50_axyejr.jpg',
    // Education
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757148/51_ppuurd.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757149/52_nk3nzn.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757148/53_ltiadd.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757147/54_rg3gxy.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757147/55_ltrw4b.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757146/56_a6va4b.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757146/57_hfkrqj.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757146/58_irhsij.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757145/59_zkkfu5.png',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757144/60_efleiv.jpg',
    // Sport
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757197/61_wdwdwf.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757196/62_zcs6nf.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757198/63_ibowax.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757200/64_deasww.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757198/65_asmloe.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757199/66_qhkgf3.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757200/67_bzktin.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757201/68_gffgjr.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757201/69_glnywf.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757199/70_ufdfx7.jpg',
    // Holiday
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757167/71_zmxapf.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757167/72_gropyv.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757167/73_negpzn.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757166/74_ohzyu2.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757166/75_rywsnm.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757169/76_dcv230.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757165/77_zh6pgh.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757169/78_buuzmn.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757168/79_rf8zs5.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757168/80_cll6a6.jpg',
    // Holiday 2
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757171/81_udnr03.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757172/82_wghfie.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757172/83_da8uab.png',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757174/84_rm7frk.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757170/85_t5jnqd.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757174/86_yqza0m.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757173/87_ja6enq.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757172/88_x9xgum.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757170/89_r4owhc.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757174/90_usvzo0.jpg',
    // Souvenir
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757196/91_gruelz.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757193/92_erdsn8.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757199/93_q5dlkj.png',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757194/94_z4eu3t.png',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757194/95_rlwotd.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757194/96_xdj178.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757194/97_dddnzf.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757191/98_vkfhe8.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757195/99_tbnrpo.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757192/100_j7fjfq.jpg',
    // Event 1
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757150/101_taemtd.png',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757150/102_iueqt9.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757151/103_ti0ojf.png',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757152/104_b4lhck.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757153/105_v8f9mu.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757149/106_kwnjno.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757151/107_bejvf5.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757153/108_s6sh90.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757154/109_rwadjq.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757152/110_lgmmzi.jpg',
    // Event 2
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757158/111_sjuu61.png',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757155/112_hp2xpw.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757157/113_ujijgp.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757156/114_brvzn3.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757155/115_hdqrm9.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757155/116_uiqd5p.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757156/117_iwoy8r.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757157/118_wkqtgl.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757159/119_y6uyll.jpg',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1726757159/120_labsl6.jpg'
  ];

  static List<String> avatar = [
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/94_fg9sT-Z9a.jpg?updatedAt=1728204755676',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/21_01QhqTGC0g.jpg?updatedAt=1728204751939',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/91_EzzYGBdooH.jpg?updatedAt=1728204751939',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/27_nGivywsmLb.jpg?updatedAt=1728204752039',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/76_563CNj4os.jpg?updatedAt=1728204751896',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/40_Yatkxpy-j.jpg?updatedAt=1728204752037',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/15_exCA6zwTLI.jpg?updatedAt=1728204751971',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/4_wQHvlDy8X.jpg?updatedAt=1728204751935',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/2_SKm5Uf1Eg.jpg?updatedAt=1728204751968',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/34_EZrYDjNNtD.jpg?updatedAt=1728204751943',
    'https://ik.imagekit.io/q5gfy1zcvl/avatars/61_1gEIMiRX5.jpg?updatedAt=1728204751769'
  ];

  static List<String> guideList = [
    'https://res.cloudinary.com/doosabwhn/image/upload/v1728043382/s1_vyo5yc.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1728043382/s2_chjh1a.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1728043382/s3_aovg9l.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1728043382/s4_kskxak.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1728043382/s5_ienewn.webp',
    'https://res.cloudinary.com/doosabwhn/image/upload/v1728043382/s6_losppk.webp'
  ];
}
