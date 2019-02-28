import React from 'react';
import { expect } from 'chai';
import { shallow, mount, render } from 'enzyme';

import HelloComponent from '../app/javascript/packs/react/HelloComponent';

describe("HelloComponent", function() {
  it("basically works", function() {
    const wrapper = mount(<HelloComponent email={'one@two.three'}/>);
    expect(wrapper.props().email).to.equal('one@two.three');
  });
});
