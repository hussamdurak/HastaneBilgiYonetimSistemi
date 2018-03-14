package application;

import database.DB;
import enums.GirisEnum;
import java.awt.Color;
import java.awt.event.KeyEvent;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import properties.GirisProperties;

/**
 *
 * @author joglen20
 */
public class GirisSayfasi extends javax.swing.JFrame {

    DB db = new DB("hastane_otomasyon", "root", "");

    public GirisSayfasi() {
        initComponents();
        setTitle("Giriş");
    }

    public void temizle(){
        txtKullaniciAdi.setText("");
        txtSifre.setText("");
    }
    
    public void rolBelirleme(int prolid) {
        if (prolid == 1) {
            AdminSayfasi as = new AdminSayfasi();
            as.setVisible(true);
        } else if (prolid == 2) {
            DoktorSayfasi ds = new DoktorSayfasi();
            ds.setVisible(true);
        } else if (prolid == 3) {
            PersonelSayfasi ps = new PersonelSayfasi();
            ps.setVisible(true);
        }
    }

    public void kullaniciDataGetir() {
        GirisProperties gp = new GirisProperties();

        gp.setPtckn(txtKullaniciAdi.getText().trim());
        gp.setPsifre(txtSifre.getText().trim());
        int pdurum = 0;
        int prolid = 0;
        String gelenSifre = "";

        try {
            String q = "call personelGiris('" + gp.getPtckn() + "')";
            ResultSet rs = db.baglan().executeQuery(q);
            while (rs.next()) {
                pdurum = rs.getInt("" + GirisEnum.pdurum);
                prolid = rs.getInt("" + GirisEnum.prolid);
                gelenSifre = rs.getString("" + GirisEnum.psifre);
            }
        } catch (Exception e) {
            System.err.println("Kullanici Data Getirme Hatasi !");
        }

        if (pdurum == 2) {
            JOptionPane.showMessageDialog(rootPane, "Kullanıcı Durumu Pasif ! " + "\n Lütfen Firma ile İleşime Geçiniz");
            temizle();
        } else if (!gelenSifre.equals(gp.getPsifre())) {
            JOptionPane.showMessageDialog(rootPane, "Kullanıcı Adı veya Şifre Hatalı !" + "\n Lütfen Tekrar Deneyiniz");
            temizle();
        } else if (gelenSifre.equals(gp.getPsifre())) {
            rolBelirleme(prolid);
            temizle();
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txtKullaniciAdi = new javax.swing.JTextField();
        txtSifre = new javax.swing.JTextField();
        lblSifreUnuttum = new javax.swing.JLabel();
        btnGirisYap = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Giriş"));

        jLabel2.setText("Kullanıcı Adı");

        jLabel3.setText("Şifre");

        txtSifre.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                txtSifreKeyPressed(evt);
            }
        });

        lblSifreUnuttum.setText("Şifremi Unuttum");
        lblSifreUnuttum.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseMoved(java.awt.event.MouseEvent evt) {
                lblSifreUnuttumMouseMoved(evt);
            }
        });
        lblSifreUnuttum.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                lblSifreUnuttumMouseClicked(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                lblSifreUnuttumMouseExited(evt);
            }
        });

        btnGirisYap.setText("Giriş Yap");
        btnGirisYap.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGirisYapActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(11, 11, 11)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(btnGirisYap, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(txtSifre, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtKullaniciAdi, javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel2Layout.createSequentialGroup()
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 178, Short.MAX_VALUE)
                                .addComponent(lblSifreUnuttum)))
                        .addGap(11, 11, 11))))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtKullaniciAdi, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(lblSifreUnuttum))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtSifre, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnGirisYap, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/if_10_hospital_2774741 (1).png"))); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(34, 34, 34)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 256, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(35, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(29, Short.MAX_VALUE))
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void lblSifreUnuttumMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblSifreUnuttumMouseClicked
        SifreSifirlama ss = new SifreSifirlama();
        ss.setVisible(true);
    }//GEN-LAST:event_lblSifreUnuttumMouseClicked

    private void lblSifreUnuttumMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblSifreUnuttumMouseExited
        lblSifreUnuttum.setForeground(Color.BLACK);
    }//GEN-LAST:event_lblSifreUnuttumMouseExited

    private void lblSifreUnuttumMouseMoved(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_lblSifreUnuttumMouseMoved
        lblSifreUnuttum.setForeground(Color.ORANGE);
    }//GEN-LAST:event_lblSifreUnuttumMouseMoved

    private void btnGirisYapActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGirisYapActionPerformed
        kullaniciDataGetir();
        temizle();
    }//GEN-LAST:event_btnGirisYapActionPerformed

    private void txtSifreKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtSifreKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            kullaniciDataGetir();
        }
    }//GEN-LAST:event_txtSifreKeyPressed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(GirisSayfasi.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(GirisSayfasi.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(GirisSayfasi.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GirisSayfasi.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new GirisSayfasi().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnGirisYap;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JLabel lblSifreUnuttum;
    private javax.swing.JTextField txtKullaniciAdi;
    private javax.swing.JTextField txtSifre;
    // End of variables declaration//GEN-END:variables
}
