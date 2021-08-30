package DAO;

public class Design {
    private String color;
    private String logo;
    private String text;
    private String img;

    public Design() {
    }

    public Design(String color, String logo, String text, String img) {
        this.color = color;
        this.logo = logo;
        this.text = text;
        this.img = img;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
