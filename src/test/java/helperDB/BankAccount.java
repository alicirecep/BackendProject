package helperDB;

import com.github.javafaker.Faker;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class BankAccount {
    static Faker faker=new Faker();
    private static int bank_accounts_id;
    private static String bank_name;
    private static String branch_name;
    private static String account_name;
    private static String account_number;

    public static Double setOpening_balance(Double opening_balance) {
        BankAccount.opening_balance = opening_balance;
        return opening_balance;
    }

    private static Double opening_balance;
    private static String description;
    private  static int status;

    public BankAccount(int bank_accounts_id,String bank_name,String  branch_name,String account_name,String account_number,double opening_balance,String description,int status) {
        this.bank_accounts_id=bank_accounts_id;
        this.bank_name=bank_name;
        this.branch_name=branch_name;
        this.account_name=account_name;
        this.account_number=account_number;
        this.opening_balance=   opening_balance;
        this.description=description;
        this.status=status;

    }

    public static int getBank_accounts_id() {
        return bank_accounts_id;
    }

    public static String getBank_name() {
        return bank_name;
    }

    public static String getBranch_name() {
        return branch_name;
    }

    public static String getAccount_name() {
        return account_name;
    }

    public static String getAccount_number() {
        return account_number;
    }

    public static Double getOpening_balance() {
        return opening_balance;
    }

    public static String getDescription() {
        return description;
    }

    public static int getStatus() {
        return status;
    }
    public static List<BankAccount> generateBankAccount(int count) {
        List<BankAccount> bankAccounts = new ArrayList<>();
        //bank_accounts (id ,bank_name, branch_name, account_name,account_number, opening_balance, description, status)
        for (int i = 0; i < count; i++) {
            BankAccount bankAccount = new BankAccount(
                    (int) faker.number().randomNumber(),
                    faker.company().name(),
                    faker.lorem().word(),
                    faker.company().name(),
                    faker.numerify("#######"),
                    faker.random().nextDouble(),
                    faker.lorem().word(),
                    faker.number().randomDigitNotZero());


            bankAccounts.add(bankAccount);
        }
        return bankAccounts;
    }
////bank_accounts (id,bank_name,branch_name, account_name,account_number,opening_balance,description,status)






}
