
package erp.entities;

/**
 *
 * @author lespinoza
 */
public class Contact {
    private Long id;
    private String suffix;
    private String title;
    private String firstName;
    private String middleName;
    private String lastName;
    private String surname;
    private String email;
    private String workPhone;
    private String homePhone;
    private String mobilPhone;

    public Contact(Long id, String suffix, String title, String firstName, String middleName, String lastName, String surname, String email, String workPhone, String homePhone, String mobilPhone) {
        this.id = id;
        this.suffix = suffix;
        this.title = title;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.surname = surname;
        this.email = email;
        this.workPhone = workPhone;
        this.homePhone = homePhone;
        this.mobilPhone = mobilPhone;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getWorkPhone() {
        return workPhone;
    }

    public void setWorkPhone(String phone) {
        this.workPhone = phone;
    }

    public String getHomePhone() {
        return homePhone;
    }

    public void setHomePhone(String phone) {
        this.homePhone = phone;
    }
    
    public String getMobilPhone() {
        return mobilPhone;
    }

    public void setMobilPhone(String mobilPhone) {
        this.mobilPhone = mobilPhone;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        if (this.lastName.isEmpty() && this.firstName.isEmpty())
            return this.lastName;
        else
            return this.lastName + ", " + this.firstName;
    }
    
    
}
