package pojos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AddPojo {

    /*
    {
"title" : "New Blog",
"category_id" :1,
"summary":"Blog Summary."
}
     */

    private String title;
    private int category_id;
    private String summary;

}
