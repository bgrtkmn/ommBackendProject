package pojos;

import java.io.Serializable;

public class BlogPojo implements Serializable {
	private String title;
	private int categoryId;
	private String summary;

	public void setTitle(String title){
		this.title = title;
	}

	public String getTitle(){
		return title;
	}

	public void setCategoryId(int categoryId){
		this.categoryId = categoryId;
	}

	public int getCategoryId(){
		return categoryId;
	}

	public void setSummary(String summary){
		this.summary = summary;
	}

	public String getSummary(){
		return summary;
	}

	@Override
 	public String toString(){
		return 
			"BlogPojo{" + 
			"title = '" + title + '\'' + 
			",category_id = '" + categoryId + '\'' + 
			",summary = '" + summary + '\'' + 
			"}";
		}
}