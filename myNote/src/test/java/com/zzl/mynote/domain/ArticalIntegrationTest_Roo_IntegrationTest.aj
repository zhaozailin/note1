// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.zzl.mynote.domain;

import com.zzl.mynote.domain.Artical;
import com.zzl.mynote.domain.ArticalDataOnDemand;
import com.zzl.mynote.domain.ArticalIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArticalIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ArticalIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ArticalIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ArticalIntegrationTest: @Transactional;
    
    @Autowired
    ArticalDataOnDemand ArticalIntegrationTest.dod;
    
    @Test
    public void ArticalIntegrationTest.testCountArticals() {
        Assert.assertNotNull("Data on demand for 'Artical' failed to initialize correctly", dod.getRandomArtical());
        long count = Artical.countArticals();
        Assert.assertTrue("Counter for 'Artical' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ArticalIntegrationTest.testFindArtical() {
        Artical obj = dod.getRandomArtical();
        Assert.assertNotNull("Data on demand for 'Artical' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Artical' failed to provide an identifier", id);
        obj = Artical.findArtical(id);
        Assert.assertNotNull("Find method for 'Artical' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Artical' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ArticalIntegrationTest.testFindAllArticals() {
        Assert.assertNotNull("Data on demand for 'Artical' failed to initialize correctly", dod.getRandomArtical());
        long count = Artical.countArticals();
        Assert.assertTrue("Too expensive to perform a find all test for 'Artical', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Artical> result = Artical.findAllArticals();
        Assert.assertNotNull("Find all method for 'Artical' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Artical' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ArticalIntegrationTest.testFindArticalEntries() {
        Assert.assertNotNull("Data on demand for 'Artical' failed to initialize correctly", dod.getRandomArtical());
        long count = Artical.countArticals();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Artical> result = Artical.findArticalEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Artical' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Artical' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ArticalIntegrationTest.testFlush() {
        Artical obj = dod.getRandomArtical();
        Assert.assertNotNull("Data on demand for 'Artical' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Artical' failed to provide an identifier", id);
        obj = Artical.findArtical(id);
        Assert.assertNotNull("Find method for 'Artical' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArtical(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Artical' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ArticalIntegrationTest.testMergeUpdate() {
        Artical obj = dod.getRandomArtical();
        Assert.assertNotNull("Data on demand for 'Artical' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Artical' failed to provide an identifier", id);
        obj = Artical.findArtical(id);
        boolean modified =  dod.modifyArtical(obj);
        Integer currentVersion = obj.getVersion();
        Artical merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Artical' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ArticalIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Artical' failed to initialize correctly", dod.getRandomArtical());
        Artical obj = dod.getNewTransientArtical(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Artical' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Artical' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Artical' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ArticalIntegrationTest.testRemove() {
        Artical obj = dod.getRandomArtical();
        Assert.assertNotNull("Data on demand for 'Artical' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Artical' failed to provide an identifier", id);
        obj = Artical.findArtical(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Artical' with identifier '" + id + "'", Artical.findArtical(id));
    }
    
}