package se.inherit.components;

import java.util.ArrayList;
import java.util.List;

import org.hippoecm.hst.component.support.bean.BaseHstComponent;
import org.hippoecm.hst.content.beans.standard.HippoBean;
import org.hippoecm.hst.core.component.HstComponentException;
import org.hippoecm.hst.core.component.HstRequest;
import org.hippoecm.hst.core.component.HstResponse;
import org.hippoecm.hst.core.sitemenu.HstSiteMenuItem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import se.motrice.hippo.beans.TextImageDocument;

public class MenuBasedDetail extends BaseHstComponent {

	public static final Logger log = LoggerFactory
			.getLogger(MenuBasedDetail.class);

	@Override
	public void doBeforeRender(final HstRequest request,
			final HstResponse response) throws HstComponentException {

		HippoBean doc = getContentBean(request);

		if (doc == null) {
			log.warn(
					"Did not find a content bean for relative content path '{}' for pathInfo '{}'",
					request.getRequestContext().getResolvedSiteMapItem()
							.getRelativeContentPath(), request
							.getRequestContext().getResolvedSiteMapItem()
							.getPathInfo());
			response.setStatus(404);
			return;
		}

		TextImageDocument overview = doc.getBean("overview/overview",
				TextImageDocument.class);
		if (overview != null) {
			request.setAttribute("overviewdoc", overview);
		} else {
			log.warn("MenuBasedDetail: no overview bean found...");
		}

		// request.setAttribute("document",doc);

/*
		ArrayList<String> childMenuPaths = new ArrayList<String>();

		for (HstSiteMenuItem childPathEntry : childrenOfSelected) {
			childMenuPaths.add(childPathEntry.getHstLink().getPath());
		}
		
		request.setAttribute("docdetail1", childMenuPaths);

		// log.warn("MenuBasedDetail: Relative content path: '{}',  PathInfo: '{}'",
		// request.getRequestContext().getResolvedSiteMapItem().getRelativeContentPath(),
		// request.getRequestContext().getResolvedSiteMapItem().getPathInfo());

		List<HippoBean> childBeans = doc.getChildBeans(HippoBean.class);

		ArrayList<String> childBeansClassName = new ArrayList<String>();
		ArrayList<String> childBeansPath = new ArrayList<String>();

		for (HippoBean childHippoBean : childBeans) {
			childBeansClassName.add(childHippoBean.getClass().getName());
			childBeansPath.add(childHippoBean.getPath());
		}

		request.setAttribute("docdetail2", childBeansClassName);
		request.setAttribute("docdetail3", childBeansPath);
*/
		
		// get menuItems that are children of selected
		// getChildMenuItems() also returns the parent entry, therefore
		// removing reference to selected parent from list, keeping only its
		// children 
		List<HstSiteMenuItem> childrenOfSelected = request.getRequestContext()
				.getHstSiteMenus().getSiteMenu("main").getSelectSiteMenuItem()
				.getChildMenuItems();

		//		childrenOfSelected.remove(request.getRequestContext()
		//					.getHstSiteMenus()
		//					.getSiteMenu("main").getSelectSiteMenuItem());
		
		// The previous removal did not work, instead we copy into a new array:

		List <HstSiteMenuItem> onlyChildrenOfSelected = new ArrayList<HstSiteMenuItem>();

		for (HstSiteMenuItem menuItem : childrenOfSelected) {
//			System.out.println("MenuItem name:" +menuItem.getName());
			if (!menuItem.isSelected()) {
//				System.out.println("Adding menuItem name: " + menuItem.getName());
				onlyChildrenOfSelected.add(menuItem);
			}
		}
		
		ArrayList<HippoBean> menuBeans = new ArrayList<HippoBean>();

		for (HstSiteMenuItem childMenuEntry : onlyChildrenOfSelected) {
			HippoBean backingBean = getBeanForResolvedSiteMapItem(request,
					childMenuEntry.resolveToSiteMapItem(request));
			
			if (backingBean.getClass().getName().endsWith("TextImageDocument")) {
				menuBeans.add(backingBean);
			} else if (backingBean.getClass().getName().endsWith("HippoFolder")) {
				// String relContentPath = request.getRequestContext().getResolvedSiteMapItem().getRelativeContentPath();
				// System.out.println("MenuBasedDetail: relativeContentPath: " + relContentPath);
				List <TextImageDocument> childList = backingBean.getChildBeansByName("overview", TextImageDocument.class);
				int min = 1000000;
				TextImageDocument nearestOverview = null;
				for (TextImageDocument curDoc : childList) {
					if (curDoc.getPath().length() < min) {
						min = curDoc.getPath().length();
						nearestOverview = curDoc;
					}
					menuBeans.add(nearestOverview);
				}				
			} else {
				log.warn("MenuBasedDetail: backingBean neither HippoFolder nor TextImageDocument");
			}
		}

		request.setAttribute("summarylist", menuBeans);

		/*
		ArrayList<String> menuBeansClassName = new ArrayList<String>();
		ArrayList<String> menuBeansPath = new ArrayList<String>();

		for (HippoBean menuHippoBean : menuBeans) {
			menuBeansClassName.add(menuHippoBean.getClass().getName());
			menuBeansPath.add(menuHippoBean.getPath());
		}

		request.setAttribute("docdetail4", menuBeansClassName);
		request.setAttribute("docdetail5", menuBeansPath);
		 */
	}
}
