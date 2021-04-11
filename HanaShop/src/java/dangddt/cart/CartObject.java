package dangddt.cart;

import dangddt.product.ProductDTO;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author tamda
 */
public class CartObject implements Serializable {

    private Map<String, ProductDTO> items;
    private float totalPrice;
    
    
    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
    public CartObject() {

    }
    public Map<String, ProductDTO> getItems() {
        return items;
    }

    public void addItemToCart(ProductDTO dto) {
        if (null == this.items) {
            this.items = new HashMap<>();
        }
        int quantity = 1;
        if (this.items.containsKey(dto.getProID())) {
            quantity = items.get(dto.getProID()).getQuantity() + 1;
            items.get(dto.getProID()).setQuantity(quantity);
        } else {
            this.items.put(dto.getProID(), dto);
        }
        this.items.put(dto.getProID(), items.get(dto.getProID()));
    }

    public void removeItemFromCart(String id) {
        if (this.items == null) {
            return;
        }
        if (this.items.containsKey(id)) {
            this.items.remove(id);
            if (this.items.isEmpty()) {
                this.items = null;
            }
        }
    }
}
