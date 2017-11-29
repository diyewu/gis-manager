import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xz.Application;
import com.xz.dao.TuserMapper;

@RunWith(SpringJUnit4ClassRunner.class)

// 指定我们SpringBoot工程的Application启动类
@SpringBootTest(classes = Application.class)

// 由于是Web项目，Junit需要模拟ServletContext，因此我们需要给我们的测试类加上@WebAppConfiguration
@WebAppConfiguration
public class UtilTest {

	@Autowired
	private TuserMapper userMapper;

	@Test
	public void test1() {
		userMapper.selectByPrimaryKey(1L);
	}

	@Test
	public void 分页查询() {
		
		Page<Object> pageHelper = PageHelper.startPage(1, 10, true);
//		userMapper.queryList();
		long total = pageHelper.getTotal(); // 总条数
		int pages = pageHelper.getPages(); // 总页数
	}

}