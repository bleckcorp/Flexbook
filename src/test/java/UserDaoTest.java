
import com.flexbook.flexbook.DAO.UserDatabase;
import com.flexbook.flexbook.model.User;
import com.flexbook.flexbook.utilities.ConnectionManager;
import com.flexbook.flexbook.utilities.Encryption;
import org.junit.jupiter.api.Test;

import java.sql.Connection;

import static org.junit.jupiter.api.Assertions.*;


public class UserDaoTest {



    private  Connection connection;
    UserDatabase userDatabase = null;

    public Connection getConnection() {
        connection = ConnectionManager.getConnection();
        return connection;
    }
    private  User user1;
    private User user2;

    public User getUser1() {
        user1 =new User();
        user1.setFirstname("Olorode");
        user1.setLastname("Emmanuel");
        user1.setEmail("emmanuel@gmail.com");
        String encr =  Encryption.encryptPassword("1234567890");
        user1.setPassword(encr);
        user1.setDob("2021-05-19");
        user1.setGender("Female");
        return user1;
    }

    public User getUser2() {
        user2 = new User();
        user2.setFirstname("Folarin");
        user2.setLastname("Oluwamayowa");
        user2.setEmail("damola@gmail.com");
        String encr =  Encryption.encryptPassword("1234567890");
        user2.setPassword(encr);
        user2.setPassword("123456");
        user2.setDob("2018-04-19");
        user2.setGender("Male");
        return user2;
    }




    @Test
    public void verifyUserByEmail() throws Exception{
        getConnection().setAutoCommit(false);
        UserDatabase userDatabase = new UserDatabase(getConnection());

        try {

                assertEquals("stvolutosin@gmail.com",userDatabase.loadUser("stvolutosin@gmail.com").getEmail());
                assertNotEquals("damola@gmail.com",userDatabase.loadUser("invalid@gmail.com").getEmail());
        }

        catch (Exception exe){
            exe.printStackTrace();
        }

    }
    @Test
    public void login()
    {
        getConnection();
        UserDatabase userDatabase = new UserDatabase(getConnection());
        User user1 = getUser1();
        String userEmail1 = user1.getEmail();
        String userPassword1 = getUser1().getPassword();
        User user = userDatabase.login(userEmail1,userPassword1);
        User userTesting = userDatabase.login("stvolutosin@gmail.com", "1234567890");
        boolean userLogin = false;
        if(userTesting != null)
        {
            userLogin = true;
        }
        else { userLogin = false;}

       assertTrue(userLogin);

    }



}
