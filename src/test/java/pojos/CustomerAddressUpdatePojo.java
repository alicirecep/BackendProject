package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerAddressUpdatePojo {

    private String name;
    private String email;
    private String address;
    private String phone;
    private String city;
    private String state;
    private String country;
    private String postal_code;
    private String address_type;

}
