import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DomiciliosComponent } from './domicilios.component';

describe('DomiciliosComponent', () => {
  let component: DomiciliosComponent;
  let fixture: ComponentFixture<DomiciliosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DomiciliosComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DomiciliosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
