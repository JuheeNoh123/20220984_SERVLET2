package dao;    //패키지 분리
import java.util.ArrayList;
import dto.Product;    // 가져와야 하니가 임포트 해주기

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>(); // ArrayList를 Product로 캐스팅
    private static ProductRepository instance = new ProductRepository();

    public static ProductRepository getInstance(){
        return instance;
    }
	public ProductRepository() {    //데이터베이스가 없어서 직접 데이터 삽입
		Product sweartshirt = new Product("P1234", "[무료반품] 아치 베어 맨투맨 [멜란지 그레이]", 64000);
		sweartshirt.setFilename("P1234.png");
        sweartshirt.setDescription("LENGAGEMENT / LA20FWHVMT005 / 2022 F/W / 남");
		sweartshirt.setCategory("sweartshirt");
		sweartshirt.setManufacturer("랑가주망");
		sweartshirt.setUnitsInStock(1000);
		sweartshirt.setCondition("New");
        
        Product catshirt = new Product("P1235", " 나비고양이 특양면 맨투맨_B1", 42000);
        catshirt.setFilename("P1235.png");
		catshirt.setDescription("VENHIT / B1 / 2022 F/W / 남여");
		catshirt.setCategory("catshirt");
		catshirt.setManufacturer("밴힛");
		catshirt.setUnitsInStock(1000);
		catshirt.setCondition("Refurbished");

		Product Bigangel = new Product("P1236", "빅 엔젤 프린트 맨투맨 오트밀", 79000);
        Bigangel.setFilename("P1236.png");
		Bigangel.setDescription(" WHATITISNT / MG2304CR03OT / 남여");
		Bigangel.setCategory("Bigangel");
		Bigangel.setManufacturer("와릿이즌");
		Bigangel.setUnitsInStock(1000);
		Bigangel.setCondition("Old");
		
		// 위와 같이 상품 초기화 하고 아래에 상품을 추가

		listOfProducts.add(sweartshirt);
		listOfProducts.add(catshirt);
		listOfProducts.add(Bigangel);
		// listOfProducts.add(상품명);
	}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
    
    public Product getProductById(String productId){
        Product productById = null;
        for (int i = 0; i<listOfProducts.size();i++){
            Product product = listOfProducts.get(i);
            if(product != null && product.getProductId() !=null && product.getProductId().equals(productId)){    //아이디값 있는지 확인하고
                productById = product;    //해당 아이디값 초기화 한후
                break;
            }
        }
        return productById;//해당 단일 아이디 리턴
    }
    
    public void addProduct(Product product) {
	    listOfProducts.add(product);
    }
}