package cn.second_hand.cart.domain;

import org.bson.types.ObjectId;

import java.io.Serializable;
import java.util.Date;

/**
 *
 */
public class Cart implements Serializable {
    private ObjectId oid;
    /** user email **/
    private String userEmail;
    /**
     * product id
     */
    private String productId;
    /**
     * product quantity
     */
    private Integer quantity;
    /**
     * date time
     */
    private Date createAt;

    public ObjectId getOid() {
        return oid;
    }

    public void setOid(ObjectId oid) {
        this.oid = oid;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
}
