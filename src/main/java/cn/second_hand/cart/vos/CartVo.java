package cn.second_hand.cart.vos;

import org.bson.types.ObjectId;

import java.io.Serializable;
import java.util.Date;

/**
 * cart domain class used to display
 */
public class CartVo implements Serializable {
    /**
     * product id
     */
    private ObjectId productId;
    /**
     * product title
     */
    private String productTitle;
    /**
     * product picture
     */
    private String productPicture;
    /**
     * product unit price
     */
    private int productPrice;
    /**
     * product quantity
     */
    private int quantity;
    /**
     * date time
     */
    private Date createAt;

    public ObjectId getProductId() {
        return productId;
    }

    public void setProductId(ObjectId productId) {
        this.productId = productId;
    }

    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }

    public String getProductPicture() {
        return productPicture;
    }

    public void setProductPicture(String productPicture) {
        this.productPicture = productPicture;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public int getTotalPrice() {
        return quantity * productPrice;
    }
}