/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.bill_detail;

import dangddt.product.ProductDTO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;


/**
 *
 * @author Tam Dang
 */
public class BillDetailDTO {
    private Map<Integer, List<ProductDTO>> billDetail;
    public BillDetailDTO() {
        billDetail = new HashMap<>();
    }
    
    public BillDetailDTO(Map<Integer, List<ProductDTO>> billDetail) {
        this.billDetail = billDetail;
    }

    public Map<Integer, List<ProductDTO>> getBillDetail() {
        return billDetail;
    }

}
