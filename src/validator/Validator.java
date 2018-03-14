/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validator;

/**
 *
 * @author mesut.ozturk
 */
public class Validator {

    public static void adSoyadValidator(String kelime) throws Exception {
        for (char harf : kelime.toCharArray()) {
            if (!Character.isLetter(harf) && !Character.isWhitespace(harf)) {
                throw new Exception("Sadece harf kullanmalısınız");
            }
        }
    }

    public static String adSoyadHazirla(String kelime) {
        return kelime.substring(0, 1).toUpperCase() + kelime.substring(1).toLowerCase();
    }

    public static String adSoyadHazirla(String[] kelime) {
        String hazirla = "";
        for (String string : kelime) {
            hazirla += adSoyadHazirla(string) + " ";
        }
        return hazirla.trim();
    }

    public static void tcknValidator(String tckn) throws Exception {
        if (tckn.length() != 11) {
            throw new Exception("TCKN 11 haneli olmalıdır");
        }
        for (char harf : tckn.toCharArray()) {
            if (!Character.isDigit(harf)) {
                throw new Exception("TCKN de sadece rakamlar bulunmalıdır");
            }
        }
        if (Integer.valueOf(tckn.charAt(0)) == 0 || Integer.valueOf(tckn.charAt(10)) % 2 != 0) {
            throw new Exception("TCKN'niz yasadışıdır!");
        }
        int toplam1 = 0, toplam2 = 0;
        for (int i = 0; i < 11; i++) {
            if (i % 2 == 0) {
                toplam1 += Integer.valueOf(tckn.charAt(i));
            } else {
                toplam2 += Integer.valueOf(tckn.charAt(i));
            }
        }
        if (toplam1 % 10 != toplam2 % 10) {
            throw new Exception("TCKN'Niz kuralsızdır");
        }
    }

    public static void emailValidator(String email) throws Exception {
        if (!email.matches("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")) {
            throw new Exception("Email adresiniz kuralsızdır");
        }
    }

    public static void telefonValidator(String tel) throws Exception {
        if (tel.length() != 10) {
            throw new Exception("Telefon numarası 10 haneli olmalıdır");
        }
        for (char harf : tel.toCharArray()) {
            if (!Character.isDigit(harf)) {
                throw new Exception("Telefon numarasındaki tum karakterler rakam olmalıdır!");
            }
        }
        if (!tel.startsWith("5")) {
            throw new Exception("Telefon numarası 5 ile başlamalıdır");
        }
    }
}
